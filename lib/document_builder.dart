library document_builder;

import 'package:flutter/cupertino.dart';

export 'package:document_builder/widgets/list.dart' show ListDoc, ListOptions;
export 'package:document_builder/widgets/sub_title.dart' show SubTitleDoc, SubTitleOptions;
export 'package:document_builder/widgets/title.dart' show TitleDoc, TitleOptions;
export 'package:document_builder/widgets/text.dart' show TextDoc, TextOptions;
export 'package:document_builder/widgets/table.dart' show TableDoc, TableOptions;


abstract class ElementOptions {}
//
typedef ElementBuilder<T> = Widget Function(BuildContext context, T options);

// typedef IdentificatorBuilder<O extends ElementOptions> = Map<Type, ElementBuilder<O>>;
//
//
// class DocFormat<O> extends StatelessWidget {
//   Type options;
//   ElementBuilder<O> builder;
//
//   DocFormat(this.options, this.builder);
//
//   // @override
//   Widget build(BuildContext context) => builder(context, options);
// }
//
//
// class DocBuilder extends StatelessWidget {
//   final List<DocFormat> types;
//   final List<ElementOptions> options;
//
//   const DocBuilder({super.key, required this.options, required this.types});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//         children: options.map((option) {
//           for (var element in types) {
//             if(option.runtimeType == element.options) {
//               return element.build(context);
//             }
//           }
//           return Container();
//         }).toList()
//     );
//   }
// }
abstract class DocumentBuilderBase<O extends ElementOptions> extends StatefulWidget {

  const DocumentBuilderBase({super.key});

  @protected
  Widget build(BuildContext context, O options);

}

@immutable
class DocumentBuilder<O extends ElementOptions> extends DocumentBuilderBase<O> {
  final ElementBuilder<O> builder;

  late O options;
  DocumentBuilder({super.key, required this.builder});

  Type get dynamicOptionsType => O;


  @override
  Widget build(BuildContext context, O options) {
    this.options = options;
    return builder(context, options);
  }

  @override
  State<StatefulWidget> createState() => _DocumentBuilderBase<O>();
}

class _DocumentBuilderBase<O extends ElementOptions> extends State<DocumentBuilder<O>> {

  @override
  Widget build(BuildContext context) {
    return widget.build(context, widget.options);
  }
  
}

class Document extends StatelessWidget {
  final List<DocumentBuilder> builders;
  final List<ElementOptions> options;

  const Document({super.key, required this.builders, required this.options});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: options.map((option) {
        for (var builder in builders) {
          if(option.runtimeType == builder.dynamicOptionsType) {
            return builder.build(context, option);
          }
        }
        return Container();
      }).toList(),
    );
  }

}
