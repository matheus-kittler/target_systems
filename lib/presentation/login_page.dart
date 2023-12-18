import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:target_challenge/auth/auth.dart';
import 'package:target_challenge/controllers/login_controller.dart';
import 'package:target_challenge/if_debugging.dart';
import 'package:target_challenge/widgets/custom_text_field.dart';
import 'package:target_challenge/widgets/gradient_background.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final loginController = LoginController();
  final formKey = GlobalKey<FormState>();

  Color primeColor = const Color(0xFF001F3F);
  Color secundaryColor = const Color(0xFF0074CC);
  String userTitle = 'Usuário';
  String passwordTitle = 'Senha';
  String? errorMessage = '';
  Icon userIcon = const Icon(Icons.person);
  Icon passwordIcon = const Icon(Icons.lock);

  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();

  Future<void> signIn() async {
    try {
      await Auth().signIn(
          email: controllerEmail.text, password: controllerPassword.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  void validateTextField() {
    if (formKey.currentState!.validate()) {
      loginController.isValid;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        primaryColor: primeColor,
        secondColor: secundaryColor,
        widget: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Observer(builder: (_) {
                  return CustomTextField(
                    controller: TextEditingController(),
                    onChanged: (_) {},
                    title: userTitle,
                    icon: userIcon,
                    checkTextField: loginController.isValid,
                    color:
                        loginController.checkEmail ? Colors.red : Colors.white,
                  );
                }),
                const SizedBox(height: 16.0),
                Observer(builder: (_) {
                  return CustomTextField(
                    controller: TextEditingController(),
                    onChanged: (_) {},
                    title: passwordTitle,
                    icon: passwordIcon,
                    checkTextField: loginController.isValid,
                    color: loginController.checkPassword
                        ? Colors.red
                        : Colors.white,
                  );
                }),
                const SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () {
                    final email = emailController.text;
                    final password = passwordController.text;
                    // context.read<>().login
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF28A745),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 24.0,
                    ),
                    child: Text(
                      'Entrar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
