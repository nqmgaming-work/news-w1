import 'package:first_pj/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:first_pj/core/themes/theme.dart';
import 'package:first_pj/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:first_pj/features/auth/presentation/pages/login_page.dart';
import 'package:first_pj/features/blog/presentation/blog/blog_bloc.dart';
import 'package:first_pj/features/blog/presentation/pages/blog_page.dart';
import 'package:first_pj/init_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => serviceLocator<AppUserCubit>(),
      ),
      BlocProvider(
        create: (_) => serviceLocator<AuthBloc>(),
      ),
      BlocProvider(
        create: (_) => serviceLocator<BlogBloc>(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(AuthCheckCurrentUser());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeApp.darkThemeMode,
      home: BlocSelector<AppUserCubit, AppUserState, bool>(
        selector: (state) {
          return state is AppUserLoggedIn;
        },
        builder: (context, isLoggedIn) {
          if (isLoggedIn) {
            return const BlogPage();
          } else {
            return const LoginPage();
          }
        },
      ),
    );
  }
}
