import 'dart:io';

import 'package:first_pj/core/usecases/usecase.dart';
import 'package:first_pj/features/blog/domain/entities/blog.dart';
import 'package:first_pj/features/blog/domain/usecase/get_all_blogs.dart';
import 'package:first_pj/features/blog/domain/usecase/upload_blog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'blog_event.dart';

part 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final UploadBlog _uploadBlog;
  final GetAllBlogs _getAllBlogs;

  BlogBloc({
    required UploadBlog uploadBlog,
    required GetAllBlogs getAllBlogs,
  })  : _uploadBlog = uploadBlog,
        _getAllBlogs = getAllBlogs,
        super(BlogInitial()) {
    on<BlogEvent>((event, emit) => emit(BlogLoading()));
    on<BlogUpload>(_onBlogUpload);
    on<BlogGetAll>(_onGetBlogs);
  }

  void _onBlogUpload(BlogUpload event, Emitter<BlogState> emit) async {
    final response = await _uploadBlog(
      UploadBlogParams(
        posterId: event.posterId,
        title: event.title,
        content: event.content,
        image: event.file,
        topics: event.topics,
      ),
    );

    response.fold(
      (failure) {
        emit(BlogFailure(message: failure.message));
      },
      (blog) {
        emit(BlogUploadSuccess());
      },
    );
  }

  void _onGetBlogs(event, Emitter<BlogState> emit) async {
    final response = await _getAllBlogs(NoParams());

    response.fold(
      (failure) {
        emit(BlogFailure(message: failure.message));
      },
      (blogs) {
        emit(BlogDisplay(blogs: blogs));
      },
    );
  }
}
