import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String label;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextAlign? textAlign;
  const TextWidget(
      {super.key,
      this.textAlign,
      this.maxLines,
      this.color,
      required this.label,
      this.fontSize = 16,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: textAlign,
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
