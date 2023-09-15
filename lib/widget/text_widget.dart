import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String label;
  double? fontSize = 16;
  Color? color;
  FontWeight? fontWeight;
  final int maxLines;
  TextWidget(
      {super.key,
      required this.maxLines,
      this.color,
      required this.label,
      required this.fontSize,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      maxLines: maxLines,
      style: TextStyle(
          overflow: TextOverflow.ellipsis,
          fontSize: fontSize,
          fontWeight: fontWeight ?? FontWeight.bold,
          color: color ?? Colors.white),
    );
  }
}
