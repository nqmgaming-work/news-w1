import 'package:first_pj/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:first_pj/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:first_pj/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:first_pj/features/auth/domain/repositoty/auth_repository.dart';
import 'package:first_pj/features/auth/domain/usecases/user_sign_up.dart';
import 'package:first_pj/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:first_pj/features/blog/data/datasources/blog_remote_data_source.dart';
import 'package:first_pj/features/blog/data/repositories/blog_repository_impl.dart';
import 'package:first_pj/features/blog/domain/repositories/blog_repository.dart';
import 'package:first_pj/features/blog/domain/usecase/get_all_blogs.dart';
import 'package:first_pj/features/blog/domain/usecase/upload_blog.dart';
import 'package:first_pj/features/blog/presentation/blog/blog_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/secrets/app_secrets.dart';
import 'features/auth/domain/usecases/current_user.dart';
import 'features/auth/domain/usecases/user_login.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  // Initialize Supabase before registering dependencies
  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supbaseAnonkey,
  );

  // Register SupabaseClient
  serviceLocator.registerLazySingleton(() => supabase.client);

  // Core
  serviceLocator.registerLazySingleton(() => AppUserCubit());

  // Initialize other dependencies
  _initAuth();
  _initBlog();
}

void _initAuth() {
  // Data sources
  serviceLocator
    ..registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(serviceLocator<SupabaseClient>()),
    )
    // Repositories
    ..registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(serviceLocator<AuthRemoteDataSource>()),
    )
    // Use cases
    ..registerFactory<UserSignUp>(
      () => UserSignUp(serviceLocator<AuthRepository>()),
    )
    // Use cases
    ..registerFactory<UserLogin>(
      () => UserLogin(serviceLocator<AuthRepository>()),
    )
    ..registerFactory<CurrentUser>(
      () => CurrentUser(serviceLocator<AuthRepository>()),
    )
    // Blocs
    ..registerLazySingleton<AuthBloc>(
      () => AuthBloc(
        userSignup: serviceLocator<UserSignUp>(),
        userLogin: serviceLocator<UserLogin>(),
        currentUser: serviceLocator<CurrentUser>(),
        appUserCubit: serviceLocator<AppUserCubit>(),
      ),
    );
}

void _initBlog() {
  // Data sources
  serviceLocator
    ..registerFactory<BlogRemoteDataSource>(
      () => BlogRemoteDataSourceImpl(
          supabaseClient: serviceLocator<SupabaseClient>()),
    )
    // Repositories
    ..registerFactory<BlogRepository>(
      () => BlogRepositoryImpl(
        blogRemoteDataSource: serviceLocator<BlogRemoteDataSource>(),
      ),
    )
    // Use cases
    ..registerFactory<UploadBlog>(
      () => UploadBlog(blogRepository: serviceLocator<BlogRepository>()),
    )
    ..registerFactory<GetAllBlogs>(
      () => GetAllBlogs(blogRepository: serviceLocator<BlogRepository>()),
    )
    // Blocs
    ..registerLazySingleton<BlogBloc>(
      () => BlogBloc(
        uploadBlog: serviceLocator<UploadBlog>(),
        getAllBlogs: serviceLocator<GetAllBlogs>(),
      ),
    );
}
