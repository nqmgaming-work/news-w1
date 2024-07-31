import 'dart:io';

import 'package:first_pj/core/error/exceptons.dart';
import 'package:first_pj/core/error/failures.dart';
import 'package:first_pj/features/blog/data/datasources/blog_remote_data_source.dart';
import 'package:first_pj/features/blog/data/models/blog_model.dart';
import 'package:first_pj/features/blog/domain/entities/blog.dart';
import 'package:first_pj/features/blog/domain/repositories/blog_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:uuid/uuid.dart';

class BlogRepositoryImpl implements BlogRepository {
  final BlogRemoteDataSource blogRemoteDataSource;

  BlogRepositoryImpl({
    required this.blogRemoteDataSource,
  });

  @override
  Future<Either<Failure, Blog>> uploadBlog({
    required File file,
    required String title,
    required String content,
    required String posterId,
    required List<String> topics,
  }) async {
    BlogModel blogModel = BlogModel(
      id: const Uuid().v1(),
      posterId: posterId,
      title: title,
      content: content,
      imageUrl: "",
      topics: topics,
      updatedAt: DateTime.now(),
    );
    try {
      final imageUrl = await blogRemoteDataSource.uploadBlogImage(
        image: file,
        blogModel: blogModel,
      );

      blogModel = blogModel.copyWith(imageUrl: imageUrl);

      final uploadedBlog = await blogRemoteDataSource.uploadBlog(blogModel);

      return Right(uploadedBlog);
    } on ServerException catch (e) {
      print("Running uploadBlogggg");
      await blogRemoteDataSource.deleteBlogImage(blogModel.id);
      return Left(Failure(message: e.message));
    }
  }
}
