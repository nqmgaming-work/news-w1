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
      print("Running deleteBlogImage");
      supabaseClient.storage.from('blog_images').remove([id]);
      if (supabaseClient.storage.from('blog_images').getPublicUrl(id) == null) {
        print("Running deleteBlogImage true");
        return Future.value(true);
      } else {
        print("Running deleteBlogImage false");
        return Future.value(false);
      }
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
