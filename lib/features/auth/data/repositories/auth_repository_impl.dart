import 'package:first_pj/core/error/exceptons.dart';
import 'package:first_pj/core/error/failures.dart';
import 'package:first_pj/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:first_pj/features/auth/domain/repositoty/auth_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

import '../../../../core/entities/user.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  const AuthRepositoryImpl(this.authRemoteDataSource);

  @override
  Future<Either<Failure, User>> currentUser() async {
    try {
      final userModel = await authRemoteDataSource.getCurrentUserData();
      if (userModel == null) {
        return Left(Failure(message: 'User not logged in!'));
      } else {
        final user = User(
          id: userModel.id,
          name: userModel.name,
          email: userModel.email,
        );
        return Right(user);
      }
    } on ServerException catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    return _getUser(
      () => authRemoteDataSource.loginWithEmailPassword(
        email: email,
        password: password,
      ),
    );
  }

  @override
  Future<Either<Failure, User>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    return _getUser(
      () => authRemoteDataSource.signUpWithEmailPassword(
        name: name,
        email: email,
        password: password,
      ),
    );
  }

  Future<Either<Failure, User>> _getUser(
      Future<User> Function() getUser) async {
    try {
      final user = await getUser();
      return Right(user);
    } on supabase.AuthException catch (e) {
      return Left(Failure(message: e.message));
    } on ServerException catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
