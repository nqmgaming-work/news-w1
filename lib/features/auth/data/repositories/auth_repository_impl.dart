import 'package:first_pj/core/error/exceptons.dart';
import 'package:first_pj/core/error/failures.dart';
import 'package:first_pj/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:first_pj/features/auth/domain/entities/user.dart';
import 'package:first_pj/features/auth/domain/repositoty/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  const AuthRepositoryImpl(this.authRemoteDataSource);

  @override
  Future<Either<Failure, User>> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final user = await authRemoteDataSource.loginWithEmailPassword(
        email: email,
        password: password,
      );
      return Right(user);
    } on ServerException catch (e) {
      return Left(
        Failure(message: e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, User>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final user = await authRemoteDataSource.signUpWithEmailPassword(
        name: name,
        email: email,
        password: password,
      );
      return Right(user);
    } on ServerException catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
