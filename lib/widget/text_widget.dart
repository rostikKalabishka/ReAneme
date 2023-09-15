import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String label;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final int? maxLines;
  const TextWidget(
      {super.key,
      this.maxLines,
      this.color,
      required this.label,
      this.fontSize = 16,
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
