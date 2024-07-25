import 'package:first_pj/core/secrets/app_secrets.dart';
import 'package:first_pj/core/themes/theme.dart';
import 'package:first_pj/features/auth/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supbaseAnonkey,
  );
  runApp(const MyApp());
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
