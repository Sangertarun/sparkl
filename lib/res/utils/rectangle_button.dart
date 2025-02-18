import 'package:flutter/material.dart';
import '../drawable/styles/button_text.dart';

class RectangleButton extends StatelessWidget {
  final String title; final VoidCallback onPress; final TextStyle textStyle;
  const RectangleButton({super.key, required this.title, required this.onPress, required this.textStyle});


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: TextButton(
        onPressed: onPress,
        style: active,
        child: Text(title,style: textStyle),));
  }
}