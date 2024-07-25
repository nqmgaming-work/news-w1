import 'package:first_pj/core/error/exceptons.dart';
import 'package:first_pj/core/error/failures.dart';
import 'package:first_pj/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:first_pj/features/auth/domain/repositoty/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  const AuthRepositoryImpl(this.authRemoteDataSource);

  @override
  Future<Either<Failure, String>> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userId = authRemoteDataSource.loginWithEmailPassword(
        email: email,
        password: password,
      );
      return Right(userId as String);
    } on ServerException catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final userId = await authRemoteDataSource.signUpWithEmailPassword(
        name: name,
        email: email,
        password: password,
      );
      return Right(userId);
    } on ServerException catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
