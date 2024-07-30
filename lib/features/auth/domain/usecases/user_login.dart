import 'package:first_pj/core/error/failures.dart';
import 'package:first_pj/core/usecases/usecase.dart';
import 'package:first_pj/features/auth/domain/entities/user.dart';
import 'package:fpdart/fpdart.dart';

import '../repositoty/auth_repository.dart';

class UserLogin implements UseCase<User, UserLoginParams> {
  final AuthRepository authRepository;

  const UserLogin(this.authRepository);

  @override
  Future<Either<Failure, User>> call(UserLoginParams params) async {
    print('UserLoginParams: ${params.email} ${params.password}');
    return authRepository.loginWithEmailPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class UserLoginParams {
  final String email;
  final String password;

  UserLoginParams({
    required this.email,
    required this.password,
  });
}
