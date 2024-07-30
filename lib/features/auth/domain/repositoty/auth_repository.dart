import 'package:first_pj/features/auth/domain/entities/user.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, User>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failure, User>> loginWithEmailPassword({
    required String email,
    required String password,
  });
}
