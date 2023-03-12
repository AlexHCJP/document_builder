import 'package:document_builder/document_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void main () {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ExampleScreen(),
    );
  }
}

class ExampleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.all(20),
              child: Document(
                  options: [
                    TitleOptions(text: 'Title your document'),
                    CustomElementOptions(
                        icon: Icon(Icons.account_circle, size: 30,),
                        text: 'The user has the right to be a user'
                    )
                  ],
                  builders: [
                    DocumentBuilder<CustomElementOptions>(
                        builder: (context, options) => CustomElementWidget(options: options)
                    ),
                    DocumentBuilder<TitleOptions>(
                        builder: (context, options) => TitleDoc(options: options)
                    )
                  ]
              )
          ),
        ),
      ),
    );
  }
}


class CustomElementOptions extends ElementOptions {
  final Widget icon;
  final String? text;
  final TextStyle style;
  final EdgeInsets padding;

  CustomElementOptions({
    required this.icon,
    this.text,
    this.style = const TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w700
    ),
    this.padding = const EdgeInsets.symmetric(vertical: 20)
  });
}

class CustomElementWidget extends StatelessWidget {
  final CustomElementOptions options;

  const CustomElementWidget({super.key, required this.options});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: options.padding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          options.icon,
          SizedBox(width: 10,),
          Expanded(
            child: Text(options.text ?? '',
              style: options.style,
            ),
          )
        ],
      ),
    );
  }
}