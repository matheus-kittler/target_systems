import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:target_challenge/assets/constants.dart';

class CustomTextFieldEmail extends StatelessWidget {
  final String title;
  final Icon icon;
  final TextEditingController controller;

  const CustomTextFieldEmail({
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
    String emailError = Constants.EMAIL_ERROR;
    String emailInvalid = Constants.EMAIL_INVALID;
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
          /* autovalidate is disabled */
          controller: controller,
          inputFormatters: [
            FilteringTextInputFormatter.deny(RegExp(
                r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])')),
          ],
          keyboardType: TextInputType.text,
          maxLength: 20,
          maxLines: 1,
          validator: (value) {
            if (value != null) {
              if (value.isEmpty) {
                return emailError;
              } else if (!value.contains('@')) {
                return emailInvalid;
              } else {
                return null;
              }
            } else {
              value = '';
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
          ),
        ),
      ],
    );
  }
}
