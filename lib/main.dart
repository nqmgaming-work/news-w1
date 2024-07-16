import 'package:first_pj/map_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'gradient_container.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MaterialApp(
    home: NewWidget(),
  ));
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MapScreen(),
          GradientContainer([
            Colors.blue,
            Colors.green,
          ]),
        ],
      ),
    );
  }
}
