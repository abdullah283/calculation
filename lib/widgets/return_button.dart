import 'package:flutter/material.dart';

class ReturnButton extends StatelessWidget {
  final Color buttonColor;
  final Color buttonTextColor;
  final double buttonTextSize;
  final String buttonText;
  final Function buttonClick;

  const ReturnButton(
      {required this.buttonColor,
      required this.buttonTextSize,
      required this.buttonText,
      required this.buttonClick,
      required this.buttonTextColor,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      height: 80,
      width: 80,
      decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: const BorderRadius.all(Radius.circular(60))),
      child: TextButton(
          onPressed: () {
            buttonClick(buttonText);
          },
          child: Text(
            buttonText,
            style: TextStyle(fontSize: buttonTextSize, color: buttonTextColor),
          )),
    );
  }
}
