import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:target_challenge/widgets/gradient_background.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    Color primeColor = const Color(0xFF001F3F);
    Color secundaryColor = const Color(0xFF0074CC);

    return Scaffold(
      body: GradientBackground(
          primaryColor: primeColor,
          secondColor: secundaryColor,
          widget: Center(
            child: FloatingActionButton(onPressed: signUserOut),
          )),
    );
  }
}
