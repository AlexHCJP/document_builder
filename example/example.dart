import 'package:document_builder/document_builder.dart';
import 'package:flutter/material.dart';

class ExampleScreen extends StatelessWidget {
  const ExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(builder: (context, snapshow) {
          return Container();
        }),
        Document(
            options: [
              TitleOptions(text: 'Text'),
              ListOptions(indexList: '1', list: [
                'Hello',
                'World'
              ])
            ],
            builders: [
              DocumentBuilder<TitleOptions>(builder: (context, options) => TitleDoc(options: options)),
              DocumentBuilder<ListOptions>(builder: (context, options) => ListDoc(options: options))

            ]
        ),
      ],
    );
  }
}