import 'package:flutter/material.dart';
import 'package:target_challenge/widgets/gradient_background.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Color primeColor = const Color(0xFF001F3F);
    Color secundaryColor = const Color(0xFF0074CC);

    return Scaffold(
      body: GradientBackground(
          primaryColor: primeColor,
          secondColor: secundaryColor,
          widget: const Center(
            child: Text('Olá mundo'),
          )),
    );
  }
}
