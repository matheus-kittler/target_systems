import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:target_challenge/assets/constants.dart';

class CustomTextFieldPassword extends StatelessWidget {
  final String title;
  final Icon icon;
  final TextEditingController controller;

  const CustomTextFieldPassword({
    super.key,
    required this.title,
    required this.icon,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    //Colors
    Color colorError = const Color.fromARGB(255, 255, 157, 0);
    Color colorErrorBorder = Colors.red;
    Color colorStandard = Colors.white;
    Color colorWhite = const Color(0xffE5E5E5);
    //Strings
    String passwordError = Constants.PASSWORD_ERROR;
    String passwordMinimum = Constants.PASSWORD_MINIMUM;
    //Mesuare
    double radius = 4;
    double width = 1;

    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            textAlign: TextAlign.start,
            style: TextStyle(
              color: colorStandard,
              fontSize: 16.0,
            ),
          ),
        ),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
          inputFormatters: [
            FilteringTextInputFormatter.deny(RegExp(r'[^a-zA-Z0-9]')),
          ],
          keyboardType: TextInputType.text,
          maxLength: 20,
          maxLines: 1,
          validator: (value) {
            if (value != null) {
              if (value.isEmpty) {
                return passwordError;
              } else if (value.length < 2) {
                return passwordMinimum;
              } else {
                return null;
              }
            }
            return null;
          },
          autofocus: false,
          decoration: InputDecoration(
            errorStyle: TextStyle(color: colorError),
            prefixIcon: icon,
            errorMaxLines: 3,
            counterText: '',
            filled: true,
            fillColor: colorStandard,
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(
                width: 1,
                color: Color(0xffE5E5E5),
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
          ),
        ),
      ],
    );
  }
}
