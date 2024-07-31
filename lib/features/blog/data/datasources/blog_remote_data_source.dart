import 'dart:io';

import 'package:first_pj/core/error/exceptons.dart';
import 'package:first_pj/features/blog/data/models/blog_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class BlogRemoteDataSource {
  Future<BlogModel> uploadBlog(BlogModel blogModel);

  Future<String> uploadBlogImage({
    required File image,
    required BlogModel blogModel,
  });

  Future<bool> deleteBlogImage(String id);

  Future<List<BlogModel>> getAllBlogs();
}

class BlogRemoteDataSourceImpl implements BlogRemoteDataSource {
  final SupabaseClient supabaseClient;

  BlogRemoteDataSourceImpl({
    required this.supabaseClient,
  });

  @override
  Future<BlogModel> uploadBlog(BlogModel blogModel) async {
    try {
      final blogData = await supabaseClient
          .from('blogs')
          .insert(blogModel.toJson())
          .select();
      return BlogModel.fromJson(blogData.first);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<String> uploadBlogImage(
      {required File image, required BlogModel blogModel}) async {
    try {
      await supabaseClient.storage
          .from('blog_images')
          .upload(blogModel.id, image);
      return supabaseClient.storage
          .from('blog_images')
          .getPublicUrl(blogModel.id);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<bool> deleteBlogImage(String id) {
    try {
      supabaseClient.storage.from('blog_images').remove([id]);
      return Future.value(true);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<List<BlogModel>> getAllBlogs() async {
    try {
      final blogsData =
          await supabaseClient.from('blogs').select("*, profiles(name)");

      return blogsData
          .map(
            (blog) => BlogModel.fromJson(blog).copyWith(
              posterName: blog['profiles']['name'] as String,
            ),
          )
          .toList()
          .reversed
          .toList();
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
