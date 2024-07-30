import 'package:first_pj/core/themes/theme.dart';
import 'package:first_pj/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:first_pj/features/auth/presentation/pages/login_page.dart';
import 'package:first_pj/init_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => serviceLocator<AuthBloc>(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeApp.darkThemeMode,
      home: const LoginPage(),
    );
  }
}

class AppTheme {}
