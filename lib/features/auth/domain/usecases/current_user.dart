import 'package:first_pj/core/error/failures.dart';
import 'package:first_pj/core/usecases/usecase.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/entities/user.dart';
import '../repositoty/auth_repository.dart';

class CurrentUser implements UseCase<User, NoParams> {
  final AuthRepository repository;

  CurrentUser(this.repository);

  @override
  Future<Either<Failure, User>> call(NoParams params) {
    return repository.currentUser();
  }
}
