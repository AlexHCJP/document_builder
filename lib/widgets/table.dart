import 'package:document_builder/document_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TableOptions extends ElementOptions {

  final List<List<String>> table;

  TableOptions({required this.table});
}

class TableDoc extends StatelessWidget {
  final TableOptions options;

  const TableDoc({super.key, required this.options});

  @override
  Widget build(BuildContext context) {
    return Table(
        border: TableBorder.all(),
        children: options.table.map((tab){
          return TableRow(
              children: tab.map((e) {
                return TableCell(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Text(e),
                    )
                );
              }).toList()
          );
        }).toList()
    );
  }
}