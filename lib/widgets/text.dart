import 'package:document_builder/document_builder.dart';
import 'package:flutter/material.dart';


class TextOptions extends ElementOptions {
  final String text;
  final TextAlign textAlign;

  TextOptions({required this.text, this.textAlign = TextAlign.left});
}

class TextFormat extends DocFormat<TextOptions> {
  TextFormat(super.options, super.builder);
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
        style: const TextStyle(
            fontSize: 17, color: Colors.black, fontWeight: FontWeight.w500),
        textAlign: options.textAlign,
      ),
    );
  }
}