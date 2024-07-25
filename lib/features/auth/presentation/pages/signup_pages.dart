import 'package:first_pj/core/themes/app_pallete.dart';
import 'package:first_pj/features/auth/presentation/widgets/auth_field.dart';
import 'package:flutter/material.dart';

import '../widgets/auth_gradient_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Sign up.",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            const AuthField(hintText: "Name"),
            const SizedBox(height: 15),
            const AuthField(hintText: "Email"),
            const SizedBox(height: 15),
            const AuthField(hintText: "Password"),
            const SizedBox(height: 20),
            const AuthGradientButton(),
            const SizedBox(height: 20),
            RichText(
              text:  TextSpan(
                text: "Already have an account?",
                style: Theme.of(context).textTheme.titleMedium,
                children:  [
                  TextSpan(
                    text: " Sign in",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppPallete.gradient2,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
