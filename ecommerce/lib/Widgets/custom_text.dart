import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    required this.textStyle,
    this.overflow = TextOverflow.ellipsis,
    this.testAlign = TextAlign.left,
    this.maxLine = 1,
  });

  final String text;
  final TextStyle textStyle;
  final TextOverflow overflow;
  final TextAlign testAlign;
  final int maxLine;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle,
      textAlign: testAlign,
      overflow: overflow,
      maxLines: 1,
    );
  }
}
