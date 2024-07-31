import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:first_pj/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:first_pj/core/common/widgets/loader.dart';
import 'package:first_pj/core/themes/app_pallete.dart';
import 'package:first_pj/core/utils/pick_image.dart';
import 'package:first_pj/core/utils/show_snackbar.dart';
import 'package:first_pj/features/blog/presentation/blog/blog_bloc.dart';
import 'package:first_pj/features/blog/presentation/pages/blog_page.dart';
import 'package:first_pj/features/blog/presentation/widgets/blog_editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNewBlogPage extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const AddNewBlogPage());

  const AddNewBlogPage({super.key});

  @override
  State<AddNewBlogPage> createState() => _AddNewBlogPageState();
}

class _AddNewBlogPageState extends State<AddNewBlogPage> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  List<String> selectedTopics = [];

  File? image;

  void selectImage() async {
    final pickedImage = await pickImage();
    setState(() {
      image = pickedImage;
    });
  }

  void uploadBlog() {
    if (formKey.currentState!.validate() &&
        selectedTopics.isNotEmpty &&
        image != null) {
      final posterId =
          (context.read<AppUserCubit>().state as AppUserLoggedIn).user.id;
      context.read<BlogBloc>().add(
            BlogUpload(
                posterId: posterId,
                title: titleController.text.trim(),
                content: contentController.text.trim(),
                file: image!,
                topics: selectedTopics),
          );
    } else {
      showSnackBar(context, 'Please fill all the fields');
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Blog'),
        actions: [
          IconButton(
            onPressed: uploadBlog,
            icon: const Icon(Icons.done_rounded),
          )
        ],
      ),
      body: BlocConsumer<BlogBloc, BlogState>(
        listener: (context, state) {
          if (state is BlogFailure) {
            showSnackBar(context, state.message);
          }
          if (state is BlogUploadSuccess) {
            Navigator.pushAndRemoveUntil(
              context,
              BlogPage.route(),
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          if (state is BlogLoading) {
            return const Loader();
          }
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: selectImage,
                    child: image == null
                        ? DottedBorder(
                            color: AppPallete.borderColor,
                            dashPattern: const [10, 4],
                            radius: const Radius.circular(12),
                            borderType: BorderType.RRect,
                            strokeCap: StrokeCap.round,
                            child: const SizedBox(
                              height: 150,
                              width: double.infinity,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.folder_open,
                                    size: 40,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    'Add Image',
                                    style: TextStyle(fontSize: 15),
                                  )
                                ],
                              ),
                            ),
                          )
                        : Container(
                            height: 150,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                image: FileImage(image!),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: const Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.folder_open,
                                    size: 40,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    'Change Image',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        'Technology',
                        'Business',
                        'Programming',
                        'Entertainment',
                      ]
                          .map(
                            (e) => Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: GestureDetector(
                                onTap: () {
                                  if (selectedTopics.contains(e)) {
                                    selectedTopics.remove(e);
                                  } else {
                                    selectedTopics.add(e);
                                  }
                                  setState(() {});
                                },
                                child: Chip(
                                  color: selectedTopics.contains(e)
                                      ? const MaterialStatePropertyAll(
                                          AppPallete.gradient1)
                                      : null,
                                  label: Text(e),
                                  side: selectedTopics.contains(e)
                                      ? null
                                      : const BorderSide(
                                          color: AppPallete.borderColor,
                                        ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  BlogEditor(
                    isTitle: true,
                    controller: titleController,
                    hintText: "Title",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: BlogEditor(
                      isTitle: false,
                      controller: contentController,
                      hintText: "Content",
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
