import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:target_challenge/models/note.dart';
import 'package:target_challenge/widgets/custom_decoration.dart';
// import 'package:target_challenge/widgets/custom_text_row.dart';
import 'package:target_challenge/widgets/gradient_background.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  TextEditingController noteController = TextEditingController();
  List<Note> notes = List.empty(growable: true);
  int selectedIndex = -1;
  late SharedPreferences shared;
  final user = FirebaseAuth.instance.currentUser!;
  Color primeColor = const Color(0xFF001F3F);
  Color secundaryColor = const Color(0xFF0074CC);

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
    shared.setStringList('myData', notetListString);
  }

  readFromSharedPreferences() {
    List<String>? noteListString = shared.getStringList('myData');
    if (noteListString != null) {
      notes = noteListString
          .map((contact) => Note.fromJson(json.decode(contact)))
          .toList();
    }
    setState(() {});
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
            children: [
              notes.isEmpty
                  ? Padding(
                      padding: EdgeInsets.only(top: 30, left: 48, right: 48),
                      child: Container(
                        alignment: Alignment.center,
                        width: 300,
                        height: 300,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        child: Text('Olaolaloalsjndkjahfkahksfhk'),
                      ),
                    )
                  : Expanded(
                      child: Container(
                        decoration: BoxDecoration(color: Colors.white),
                        child: ListView.builder(
                            itemCount: notes.length,
                            itemBuilder: (context, index) => getRow(index)),
                      ),
                    ),
              Padding(
                padding: EdgeInsets.all(30.0),
                child: Container(
                  width: 300,
                  child: TextFormField(
                      textAlign: TextAlign.center,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: noteController,
                      keyboardType: TextInputType.text,
                      maxLines: 1,
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
                      },
                      decoration: CustomDecorationFormField.textFieldStyle(
                          hintTextField: 'Digite seu texto')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getRow(int index) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor:
              index % 2 == 0 ? Colors.deepPurpleAccent : Colors.purple,
          foregroundColor: Colors.white,
          child: Text(
            notes[index].text[0],
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
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
          width: 70,
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
                    //
                    setState(() {
                      notes.removeAt(index);
                    });
                    // Saving contacts list into Shared Prefrences
                    saveSharePreferences();
                    //
                  }),
                  child: const Icon(Icons.delete)),
            ],
          ),
        ),
      ),
    );
  }
}
