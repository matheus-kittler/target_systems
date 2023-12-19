import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:target_challenge/presentation/home_page.dart';
import 'package:target_challenge/presentation/login_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomePage();
          } else {
            return const LoginPage();
          }
        },
      ),
    );
  }
}
