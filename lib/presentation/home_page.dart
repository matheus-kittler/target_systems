import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:target_challenge/assets/constants.dart';
import 'package:target_challenge/models/note.dart';
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

  //Colors
  Color primeColor = const Color(0xFF001F3F);
  Color secundaryColor = const Color(0xFF0074CC);
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
  TextEditingController noteController = TextEditingController();
  List<Note> notes = List.empty(growable: true);

  //Mesuare
  int selectedIndex = -1;
  double size_30 = 30;
  double size_70 = 70;
  double size_300 = 300;
  double size_20 = 20;
  double size_55 = 55;
  double size_48 = 48;
  double size_8 = 8;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  getSharedPreferences() async {
    shared = await SharedPreferences.getInstance();
    readFromSharedPreferences();
  }

  saveSharePreferences() {
    List<String> notetListString =
        notes.map((contact) => jsonEncode(contact.toJson())).toList();
    shared.setStringList(data, notetListString);
  }

  readFromSharedPreferences() {
    List<String>? noteListString = shared.getStringList(data);
    if (noteListString != null) {
      notes = noteListString
          .map((contact) => Note.fromJson(json.decode(contact)))
          .toList();
    }
    setState(() {});
  }

  void alert(int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(delete),
            content: Text(noteController.text = notes[index].text),
            actions: [
              TextButton(
                  onPressed: () {
                    setState(() {
                      notes.removeAt(index);
                    });

                    saveSharePreferences();
                    Navigator.of(context).pop();
                  },
                  child: Text(yes)),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(no)),
            ],
          );
        });
  }

  @override
  void initState() {
    super.initState();
    getSharedPreferences();
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
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    notes.isEmpty
                        ? Padding(
                            padding: EdgeInsets.only(
                                top: size_30, left: size_48, right: size_48),
                            child: Container(
                              alignment: Alignment.center,
                              width: size_300,
                              height: size_300,
                              padding: EdgeInsets.all(size_20),
                              decoration: BoxDecoration(
                                  color: colorStandard,
                                  borderRadius: BorderRadius.circular(size_8)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                      size: size_30,
                                      Icons.not_interested_sharp),
                                  Text(emptyList),
                                ],
                              ),
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.only(
                                top: size_30, left: size_48, right: size_48),
                            child: Container(
                              alignment: Alignment.center,
                              width: size_300,
                              height: size_300,
                              decoration: BoxDecoration(color: colorStandard),
                              child: ListView.builder(
                                  itemCount: notes.length,
                                  itemBuilder: (context, index) =>
                                      getRow(index)),
                            ),
                          ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: size_30, left: size_55, right: size_55),
                      child: Container(
                        alignment: Alignment.center,
                        child: TextFormField(
                            textAlign: TextAlign.center,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: noteController,
                            focusNode: unitCodeCtrlFocusNode,
                            keyboardType: TextInputType.text,
                            maxLines: 1,
                            maxLength: 80,
                            autofocus: true,
                            onFieldSubmitted: (value) {
                              String text = noteController.text.trim();
                              if (text.isNotEmpty) {
                                setState(() {
                                  noteController.text = '';
                                  notes.add(Note(text: text));
                                });
                                saveSharePreferences();
                              }

                              unitCodeCtrlFocusNode.requestFocus();
                            },
                            decoration:
                                CustomDecorationFormField.textFieldStyle(
                                    hintTextField: yourText)),
                      ),
                    ),
                  ],
                ),
              ),
              LaunchUrl(text: policy, url: url),
            ],
          ),
        ),
      ),
    );
  }

  Widget getRow(int index) {
    return Card(
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              notes[index].text,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        trailing: SizedBox(
          width: size_48,
          child: Row(
            children: [
              InkWell(
                  onTap: () {
                    noteController.text = notes[index].text;
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: const Icon(Icons.edit)),
              InkWell(
                  onTap: (() {
                    alert(index);
                  }),
                  child: const Icon(Icons.delete)),
            ],
          ),
        ),
      ),
    );
  }
}
