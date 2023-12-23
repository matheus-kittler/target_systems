// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on HomeControllerBase, Store {
  late final _$listAtom =
      Atom(name: 'HomeControllerBase.list', context: context);

  @override
  ObservableList<dynamic> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(ObservableList<dynamic> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  late final _$HomeControllerBaseActionController =
      ActionController(name: 'HomeControllerBase', context: context);

  @override
  dynamic addList(Note note) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.addList');
    try {
      return super.addList(note);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteItemList(int index) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.deleteItemList');
    try {
      return super.deleteItemList(index);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void editItemList(int index, Note note) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.editItemList');
    try {
      return super.editItemList(index, note);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic validateTextFilled(String text) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.validateTextFilled');
    try {
      return super.validateTextFilled(text);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void customAlertDialog(String text, BuildContext context,
      Color colorBackground, Color basedColor) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.customAlertDialog');
    try {
      return super
          .customAlertDialog(text, context, colorBackground, basedColor);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
list: ${list}
    ''';
  }
}
