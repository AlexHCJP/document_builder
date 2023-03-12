import 'package:document_builder/document_builder.dart';
import 'package:flutter/material.dart';

class ListOptions extends ElementOptions {
  final String? title;
  final String? description;
  final List list;
  final String indexList;

  ListOptions(
      {required this.indexList,
      required this.list,
      this.title,
      this.description});

  ListOptions copyWith(
      {String? indexList, List? list, String? title, String? description}) {
    return ListOptions(
        indexList: indexList ?? this.indexList,
        list: list ?? this.list,
        title: title ?? this.title,
        description: description ?? this.description);
  }
}

class ListDoc extends StatelessWidget {
  final ListOptions options;

  const ListDoc({super.key, required this.options});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (options.title != null)
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              "${options.indexList}. ${options.title!}",
              style: const TextStyle(
                  fontSize: 21,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            ),
          ),
        if (options.description != null)
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              options.description!,
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: options.list.length,
            itemBuilder: (context, indexParent) {
              if (options.list[indexParent].runtimeType ==
                  ListOptions(list: [], indexList: "1").runtimeType) {
                return ListDoc(options: options.list[indexParent]);
              }

              return Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    '${options.indexList}.${indexParent + 1}. ${options.list[indexParent]}',
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                  ));
            }),
      ],
    );
  }
}
