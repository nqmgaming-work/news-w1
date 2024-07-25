import 'package:first_pj/core/themes/theme.dart';
import 'package:flutter/material.dart';

import 'features/auth/presentation/pages/signup_pages.dart';

Future main() async {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeApp.darkThemeMode,
    home: SignUpPage(),
  ));
}

class AppTheme {}
