import 'package:document_builder/document_builder.dart';
import 'package:flutter/material.dart';

class SubTitleOptions extends ElementOptions {
  final String text;
  final TextStyle style;

  SubTitleOptions({
    required this.text,
    this.style = const TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500)
  });

  SubTitleOptions copyWith({
    String? text,
    TextStyle? style
  }) {
    return SubTitleOptions(
        text: text ?? this.text,
        style: style ?? this.style
    );
  }
}

class SubTitleDoc extends StatelessWidget {
  final SubTitleOptions options;

  const SubTitleDoc({super.key, required this.options});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: Text(
        options.text,
        style: options.style,
      ),
    );
  }
}