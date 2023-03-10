
```dart
import 'package:document_builder/document_builder.dart';
import 'package:flutter/material.dart';

class ExampleScreen extends StatelessWidget {
  const ExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: DocBuilder(
            options: [
              TitleOptions('Title')
            ],
            types: [
              TitleFormat(TitleOptions, (context, options) => TitleDoc(options: options))
            ],
          ),
        ),
      ),
    );
  }

}
```