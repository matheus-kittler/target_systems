import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:target_challenge/assets/constants.dart';
import 'package:target_challenge/models/note.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  late SharedPreferences shared;
  String data = Constants.DATA;
  String filledField = Constants.FILLED_FIELD;

  getSharedPreferences() async {
    shared = await SharedPreferences.getInstance();
    readFromSharedPreferences();
  }

  readFromSharedPreferences() {
    list.clear();
    List<String>? noteListString = shared.getStringList(data);
    if (noteListString != null) {
      for (var i = 0; i < noteListString.length; i++) {
        list.add(noteListString[i]);
      }
    }
  }

  void saveListPreferences() async {
    List<String> notetListString = list.cast<String>().toList();
    await shared.setStringList(data, notetListString);
  }

  HomeControllerBase() {
    getSharedPreferences();
  }

  @observable
  ObservableList list = [].asObservable();
  @action
  addList(Note note) {
    list.add(note.title);
    saveListPreferences();
  }

  @action
  void deleteItemList(int index) {
    list.removeAt(index);
    saveListPreferences();
  }

  @action
  void editItemList(int index, Note note) {
    list[index] = note.title;
    saveListPreferences();
  }

  @action
  validateTextFilled(String text) {
    if (text.isNotEmpty) {
      return null;
    } else {
      return filledField;
    }
  }

  @action
  void customAlertDialog(String text, BuildContext context,
      Color colorBackground, Color basedColor) {
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
              backgroundColor: colorBackground,
              title: Center(
                  child: Text(
                text,
                style: TextStyle(color: basedColor),
              )),
            );
          },
        );
      },
    );
  }
}
