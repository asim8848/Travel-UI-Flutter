import 'package:cubit_app/widgets/app_text.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppButtons extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  final double size;
  final Color borderColor;
  final String? text;
  Icon? icon;
  bool isIcon;

  AppButtons(
      {Key? key,
      this.isIcon = false,
      required this.size,
      this.text = 'hi',
      this.icon,
      required this.color,
      required this.backgroundColor,
      required this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 1.0),
        borderRadius: BorderRadius.circular(15),
        color: backgroundColor,
      ),
      child: isIcon == false
          ? Center(
              child: AppText(
                text: text!,
                color: color,
              ),
            )
          : Center(
              child: icon,
            ),
    );
  }
}
