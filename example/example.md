```dart
import 'package:document_builder/document_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Document(
            options: [
              TitleOptions(text: 'Правила бойцовского клуба'),
              ListOptions(indexList: '1', list: [
                'правило Бойцовского клуба: не упоминать о Бойцовском клубе.',
                'правило Бойцовского клуба: не упоминать нигде о Бойцовском клубе.',
                'правило Бойцовского клуба: боец крикнул «стоп», выдохся, отключился — бой окончен.',
                ': в бою участвуют лишь двое.'
              ])
            ],
            builders: [
              DocumentBuilder<TitleOptions>(builder: (context, options) => TitleDoc(options: options)),
              DocumentBuilder<ListOptions>(builder: (context, options) => ListDoc(options: options))
            ],
          )
        ),
      ),
    );
  }
}
```