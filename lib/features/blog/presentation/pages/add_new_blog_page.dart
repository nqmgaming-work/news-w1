import 'package:dotted_border/dotted_border.dart';
import 'package:first_pj/core/themes/app_pallete.dart';
import 'package:first_pj/features/blog/presentation/widgets/blog_editor.dart';
import 'package:fleather/fleather.dart';
import 'package:flutter/material.dart';

class AddNewBlogPage extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const AddNewBlogPage());

  const AddNewBlogPage({super.key});

  @override
  State<AddNewBlogPage> createState() => _AddNewBlogPageState();
}

class _AddNewBlogPageState extends State<AddNewBlogPage> {
  final titleController = FleatherController();
  final contentController = FleatherController();
  List<String> selectedTopics = [];

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
          IconButton(onPressed: () {}, icon: const Icon(Icons.done_rounded))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DottedBorder(
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
            FleatherToolbar.basic(controller: contentController),
            BlogEditor(controller: titleController, hintText: "Title"),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: BlogEditor(
                controller: contentController,
                hintText: "Content",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
