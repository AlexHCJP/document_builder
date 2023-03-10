import 'package:document_builder/document_builder.dart';
import 'package:flutter/material.dart';

class SubTitleOptions extends ElementOptions {
  final String title;

  SubTitleOptions(this.title);
}

class SubTitleFormat extends DocFormat<SubTitleOptions> {
  SubTitleFormat(super.options, super.builder);
}

class SubTitleDoc extends StatelessWidget {
  final SubTitleOptions options;

  const SubTitleDoc({super.key, required this.options});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: Text(
        options.title,
        style: const TextStyle(
            fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),
      ),
    );
  }
}