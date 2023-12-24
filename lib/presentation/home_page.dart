import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:target_challenge/assets/constants.dart';
import 'package:target_challenge/controllers/home_controller.dart';
import 'package:target_challenge/models/note.dart';
import 'package:target_challenge/widgets/custom_card.dart';
import 'package:target_challenge/widgets/custom_decoration.dart';
import 'package:target_challenge/widgets/gradient_background.dart';
import 'package:target_challenge/widgets/launch_url.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  late SharedPreferences shared;
  final FocusNode unitCodeCtrlFocusNode = FocusNode();
  var controller = HomeController();
  TextEditingController textController = TextEditingController();
  var model = Note();
  bool validation = false;

  //Colors
  Color primeColor = const Color(0xFF001F3F);
  Color secundaryColor = const Color(0xFF0074CC);
  Color colorWhite = const Color(0xffE5E5E5);
  Color colorError = const Color.fromARGB(255, 255, 157, 0);
  Color colorErrorBorder = Colors.red;
  Color colorStandard = Colors.white;
  //Strings
  String data = Constants.DATA;
  String yourText = Constants.YOUR_TEXT;
  String delete = Constants.DELETE;
  String yes = Constants.YES;
  String no = Constants.NO;
  String policy = Constants.POLICY_PRIVACY;
  String url = Constants.URL;
  String emptyList = Constants.EMPTY_LIST;
  String filled = Constants.FILLED_FIELD;
  List<Note> notes = List.empty(growable: true);
  TextEditingController noteController = TextEditingController();
  //Mesuare
  int selectedIndex = -1;
  double size_30 = 30;
  double size_70 = 70;
  double size_300 = 300;
  double size_20 = 20;
  double size_55 = 55;
  double size_48 = 48;
  double size_8 = 8;
  double radius = 4;
  double width = 1;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: signUserOut,
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: GradientBackground(
        primaryColor: primeColor,
        secondColor: secundaryColor,
        widget: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Observer(builder: (context) {
                return Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomCard(homeController: controller),
                      Padding(
                        padding: EdgeInsets.only(
                            top: size_20, left: size_55, right: size_55),
                        child: Observer(builder: (context) {
                          return Container(
                            alignment: Alignment.center,
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              textAlign: TextAlign.center,
                              controller: textController,
                              onChanged: model.setText,
                              focusNode: unitCodeCtrlFocusNode,
                              keyboardType: TextInputType.text,
                              maxLines: 1,
                              maxLength: 80,
                              autofocus: true,
                              onFieldSubmitted: (value) {
                                if (value.isNotEmpty) {
                                  controller.addList(model);
                                } else {
                                  controller.customAlertDialog(
                                    filled,
                                    context,
                                    colorError,
                                    colorWhite,
                                  );
                                }
                                unitCodeCtrlFocusNode.requestFocus();
                                textController.text = '';
                              },
                              decoration:
                                  CustomDecorationFormField.textFieldStyle(
                                hintTextField: yourText,
                              ),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                );
              }),
              LaunchUrl(text: policy, url: url),
            ],
          ),
        ),
      ),
    );
  }
}
