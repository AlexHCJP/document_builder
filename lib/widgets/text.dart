import 'package:document_builder/document_builder.dart';
import 'package:flutter/material.dart';


class TextOptions extends ElementOptions {
  final String text;
  final TextAlign textAlign;
  final TextStyle style;

  TextOptions({
    required this.text,
    this.textAlign = TextAlign.center,
    this.style = const TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600)
  });

  TextOptions copyWith({
    String? text,
    TextAlign? textAlign,
    TextStyle? style
  }) {
    return TextOptions(
        text: text ?? this.text,
        textAlign: textAlign ?? this.textAlign,
        style: style ?? this.style
    );
  }
}


class TextDoc extends StatelessWidget {
  final TextOptions options;

  const TextDoc({super.key, required this.options});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      alignment: Alignment.topRight,
      child: Text(
        options.text,
        style: options.style,
        textAlign: options.textAlign,
      ),
    );
  }
}