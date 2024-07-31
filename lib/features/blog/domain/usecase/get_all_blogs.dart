import 'package:first_pj/core/error/failures.dart';
import 'package:first_pj/core/usecases/usecase.dart';
import 'package:first_pj/features/blog/domain/entities/blog.dart';
import 'package:first_pj/features/blog/domain/repositories/blog_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetAllBlogs implements UseCase<List<Blog>, NoParams> {
  final BlogRepository blogRepository;

  GetAllBlogs({
    required this.blogRepository,
  });

  @override
  Future<Either<Failure, List<Blog>>> call(NoParams params) async {
    return await blogRepository.getAllBlogs();
  }
}
