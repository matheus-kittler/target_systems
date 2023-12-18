// import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:target_challenge/presentation/login_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Targer Challenge',
      debugShowCheckedModeBanner: true,
      home: LoginPage(),
    );
  }
}
