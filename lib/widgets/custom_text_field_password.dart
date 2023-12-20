import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            textAlign: TextAlign.start,
            style: const TextStyle(
              color: Colors.white,
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
                return 'Digite sua senha';
              } else if (value.length < 2) {
                return 'Sua senha precisa ter no mínimo 2 caracteres';
              } else {
                return null;
              }
            }
          },
          autofocus: false,
          decoration: InputDecoration(
            prefixIcon: icon,
            errorMaxLines: 3,
            counterText: "",
            filled: true,
            fillColor: Colors.white,
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(
                width: 1,
                color: Color(0xffE5E5E5),
              ),
            ),
            disabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(
                width: 1,
                color: Color(0xffE5E5E5),
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(
                width: 1,
                color: Color(0xffE5E5E5),
              ),
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(
                width: 1,
              ),
            ),
            errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.red,
                )),
            focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(
                width: 1,
                color: Colors.red,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
