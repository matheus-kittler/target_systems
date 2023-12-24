import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:target_challenge/widgets/custom_text_field_email.dart';
import 'package:target_challenge/widgets/custom_text_field_password.dart';
import 'package:target_challenge/widgets/gradient_background.dart';
import 'package:target_challenge/assets/constants.dart';
import 'package:target_challenge/widgets/launch_url.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  //Colors
  Color primeColor = const Color(0xFF001F3F);
  Color secundaryColor = const Color(0xFF0074CC);
  Color errorBackground = Colors.red;
  Color colorWhiteText = Colors.white;
  Color colorBackgroundButton = const Color(0xFF28A745);
  //Strings
  String userTitle = Constants.USER;
  String passwordTitle = Constants.PASSWORD;
  String enter = Constants.ENTER;
  String policy = Constants.POLICY_PRIVACY;
  String url = Constants.URL;
  String invalidCredential = Constants.INVALID_CREDENTIAL;
  String invalidEmail = Constants.INVALID_EMAIL;
  String invalidCredentialMsg = Constants.INVALID_CREDENTIAL_MSG;
  String invalidEmailMsg = Constants.INVALID_CREDENTIAL_MSG;
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  //Icons
  Icon userIcon = const Icon(Icons.person);
  Icon passwordIcon = const Icon(Icons.lock);
  //Mesuare
  double size_12 = 12;
  double size_16 = 16;
  double size_18 = 18;
  double size_20 = 20;
  double size_24 = 24;

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
      pop();
    } on FirebaseAuthException catch (e) {
      pop();
      if (e.code == invalidCredential) {
        errorLogin(invalidCredentialMsg);
      } else if (e.code == invalidEmail) {
        errorLogin(invalidEmailMsg);
      }
    }
  }

  pop() {
    Navigator.pop(context);
  }

  void errorLogin(String text) {
    showDialog(
      context: context,
      builder: (context) {
        return FutureBuilder(
          future:
              Future.delayed(const Duration(seconds: 3)).then((value) => true),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Navigator.of(context).pop();
            }

            return AlertDialog(
              backgroundColor: errorBackground,
              title: Center(
                  child: Text(
                text,
                style: TextStyle(color: colorWhiteText),
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
            padding: EdgeInsets.all(size_16),
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
                    SizedBox(height: size_16),
                    CustomTextFieldPassword(
                      title: passwordTitle,
                      icon: passwordIcon,
                      controller: controllerPassword,
                    ),
                    SizedBox(height: size_24),
                    ElevatedButton(
                      onPressed: () {
                        signUserIn();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorBackgroundButton,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(size_20),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: size_12,
                          horizontal: size_24,
                        ),
                        child: Text(
                          enter,
                          style: TextStyle(
                            color: colorWhiteText,
                            fontSize: size_18,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
                LaunchUrl(text: policy, url: url)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
