import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  final Color primaryColor;
  final Color secondColor;
  final Widget widget;

  const GradientBackground(
      {super.key,
      required this.primaryColor,
      required this.secondColor,
      required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [primaryColor, secondColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: widget,
    );
  }
}
