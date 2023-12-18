import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final Icon icon;
  final bool checkTextField;
  final Function(String) onChanged;
  final Color color;
  final TextEditingController controller;

  const CustomTextField({
    super.key,
    required this.title,
    required this.icon,
    required this.checkTextField,
    required this.onChanged,
    required this.color,
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
        TextField(
          maxLength: 20,
          controller: controller,
          onChanged: onChanged,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            prefixIcon: icon,
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
              ),
            ),
            filled: true,
            counterText: '',
          ),
        ),
      ],
    );
  }
}
