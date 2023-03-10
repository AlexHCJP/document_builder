import 'package:document_builder/document_builder.dart';
import 'package:flutter/material.dart';

class TitleOptions extends ElementOptions {
  final String title;
  TitleOptions(this.title);
}

class TitleFormat extends DocFormat<TitleOptions> {
  TitleFormat(super.options, super.builder);
}

class TitleDoc extends StatelessWidget {
  final TitleOptions options;

  const TitleDoc({super.key, required this.options});

  @override
  Widget build(BuildContext context) {
    return Text(
      options.title,
      style: const TextStyle(
          fontSize: 24, color: Colors.black, fontWeight: FontWeight.w600),
    );
  }
}