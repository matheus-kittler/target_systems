import 'package:flutter/material.dart';

class CustomDecorationFormField {
  static InputDecoration textFieldStyle({String hintTextField = ''}) {
    Color colorError = const Color.fromARGB(255, 255, 157, 0);
    Color colorErrorBorder = Colors.red;
    Color colorStandard = Colors.white;
    Color colorWhite = const Color(0xffE5E5E5);
    double radius = 4;
    double width = 1;

    return InputDecoration(
      errorStyle: TextStyle(color: colorError),
      errorMaxLines: 3,
      counterText: '',
      filled: true,
      fillColor: colorStandard,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        borderSide: BorderSide(
          width: width,
          color: colorWhite,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        borderSide: BorderSide(
          width: width,
          color: colorWhite,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        borderSide: BorderSide(
          width: width,
          color: colorWhite,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        borderSide: BorderSide(
          width: width,
        ),
      ),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          borderSide: BorderSide(
            width: width,
            color: colorErrorBorder,
          )),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        borderSide: BorderSide(
          width: width,
          color: colorErrorBorder,
        ),
      ),
    );
  }
}
