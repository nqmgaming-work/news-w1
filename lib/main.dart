import 'package:flutter/material.dart';
import 'gradient_container.dart';

void main() {
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
    return  const Scaffold(
        body: GradientContainer([
      Color.fromARGB(100, 100, 100, 12),
      Colors.red,
    ]));
  }
}
