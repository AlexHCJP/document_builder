library document_builder;

import 'package:flutter/cupertino.dart';

export 'package:document_builder/widgets/list.dart' show ListDoc, ListOptions, ListFormat;
export 'package:document_builder/widgets/sub_title.dart' show SubTitleDoc, SubTitleOptions, SubTitleFormat;
export 'package:document_builder/widgets/title.dart' show TitleDoc, TitleOptions, TitleFormat;
export 'package:document_builder/widgets/text.dart' show TextDoc, TextOptions, TextFormat;
export 'package:document_builder/widgets/table.dart' show TableDoc, TableOptions, TableFormat;


abstract class ElementOptions {}

typedef ElementBuilder<T> = Widget Function(BuildContext context, T options);


abstract class DocFormat<O> {
  Type options;
  ElementBuilder<O> builder;

  DocFormat(this.options, this.builder);
}


class DocBuilder extends StatelessWidget {
  final List<DocFormat> types;
  final List<ElementOptions> options;

  const DocBuilder({super.key, required this.options, required this.types});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: options.map((option) {
        for (var element in types) {
          if(option.runtimeType == element.options) {
            return element.builder(context, option);
          }
        }
        return Container();
      }).toList()
    );
  }
}