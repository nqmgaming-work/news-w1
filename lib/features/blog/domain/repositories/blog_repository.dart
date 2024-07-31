import 'dart:io';

import 'package:first_pj/core/error/failures.dart';
import 'package:first_pj/features/blog/domain/entities/blog.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class BlogRepository {
  Future<Either<Failure, Blog>> uploadBlog({
    required File file,
    required String title,
    required String content,
    required String posterId,
    required List<String> topics,
  });
}
