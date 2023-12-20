import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LaunchUrl extends StatelessWidget {
  final String text;
  final String url;

  const LaunchUrl({
    super.key,
    required this.text,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    launchURL() async {
      await launchUrlString(url);
    }

    //Colors
    Color colorStandard = Colors.white;
    //Mesuare
    double size_16 = 16;

    return Align(
      alignment: Alignment.bottomCenter,
      child: InkWell(
        child: Text(
          text,
          style: TextStyle(
            fontSize: size_16,
            color: colorStandard,
          ),
        ),
        onTap: () async {
          launchURL();
        },
      ),
    );
  }
}
