import 'package:document_builder/document_builder.dart';
import 'package:flutter/material.dart';

class TitleOptions extends ElementOptions {
  final String text;
  final TextStyle style;

  TitleOptions(
      {required this.text,
      this.style = const TextStyle(
          fontSize: 24, color: Colors.black, fontWeight: FontWeight.w600)});

  TitleOptions copyWith({String? text, TextStyle? style}) {
    return TitleOptions(text: text ?? this.text, style: style ?? this.style);
  }
}

class TitleDoc extends StatelessWidget {
  final TitleOptions options;

  const TitleDoc({super.key, required this.options});

  @override
  Widget build(BuildContext context) {
    return Text(
      options.text,
      style: options.style,
    );
  }
}
