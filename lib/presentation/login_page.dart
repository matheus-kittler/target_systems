import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:target_challenge/controllers/login_controller.dart';
import 'package:target_challenge/widgets/custom_text_field_email.dart';
import 'package:target_challenge/widgets/custom_text_field_password.dart';
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
  String enter = 'Entrar';
  String policy = 'Política de Privacidade';
  String site = 'https://google.com.br/';
  String? errorMessage = '';
  Icon userIcon = const Icon(Icons.person);
  Icon passwordIcon = const Icon(Icons.lock);
  bool isValid = false;

  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();

  void signUserIn() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: controllerEmail.text,
        password: controllerPassword.text,
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        errorLogin('Not found user for that e-mail');
      } else if (e.code == 'wrong-password') {
        errorLogin('The password is not correct');
      } else if (e.code == 'invalid-credential') {
        errorLogin('The e-mail or/and password is not correct.');
      }
    }
  }

  void errorLogin(String text) {
    showDialog(
      context: context,
      builder: (context) {
        return FutureBuilder(
          future: Future.delayed(Duration(seconds: 5)).then((value) => true),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Navigator.of(context).pop();
            }

            return AlertDialog(
              backgroundColor: Colors.red,
              title: Center(
                  child: Text(
                text,
                style: TextStyle(color: Colors.white),
              )),
            );
          },
        );
      },
    );
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
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextFieldEmail(
                      title: userTitle,
                      icon: userIcon,
                      controller: controllerEmail,
                    ),
                    const SizedBox(height: 16.0),
                    CustomTextFieldPassword(
                      title: passwordTitle,
                      icon: passwordIcon,
                      controller: controllerPassword,
                    ),
                    const SizedBox(height: 24.0),
                    ElevatedButton(
                      onPressed: () {
                        signUserIn();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF28A745),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 24.0,
                        ),
                        child: Text(
                          enter,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    child: Text(
                      policy,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () async {
                      final url = site;

                      if (await canLaunchUrl(url as Uri)) {
                        await launch(url);
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
