import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:target_challenge/assets/constants.dart';
import 'package:target_challenge/models/note.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  Completer<SharedPreferences> instance = Completer<SharedPreferences>();
  late SharedPreferences shared;
  String data = Constants.DATA;

  // init() async {
  //   instance.complete(await SharedPreferences.getInstance());
  // }

  // HomeControllerBase() {
  //   init();
  //   getSharedPreferences();
  // }

  @observable
  List<Note> list = [];
  @action
  addList(Note note) {
    list = List.from(list..add(note));
  }

  @action
  void saveListPreferences() {
    SharedPreferences.getInstance().then((instance) {
      List<String> notetListString = list.cast<String>().toList();
      shared.setStringList(data, notetListString);
    });
  }

  // getSharedPreferences() async {
  //   init();
  //   readFromSharedPreferences();
  // }

  // @action
  // readFromSharedPreferences() {
  //   List<String>? noteListString = shared.getStringList(data);
  //   if (noteListString != null) {
  //     list = noteListString.map((note) => list[0]).toList();
  //   }
  // }
}
