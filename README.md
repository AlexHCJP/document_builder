
# Document builder for your fast work
#### I will continue to work on the package, like and enjoy in the near future



## Example

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


### SubTitle use with help `SubTitleDoc` and `SubTitleOptions`
```dart
SubTitleOptions(
  text: 'SubTitle',
  style: TextStyle(
    fontSize: 50
  )
)
..
...
..
DocumentBuilder<SubTitleOptions>(builder: (context, options) => SubTitleDoc(options: options))
```

### Text use with help `TextDoc` and `TextOptions`
```dart
TextOptions(
  text: 'SubTitle',
  style: TextStyle(
    fontSize: 50
  )
)
..
...
..
DocumentBuilder<TextOptions>(builder: (context, options) => TextDoc(options: options))
```


### Table use with help `TableDoc` and `TableOptions`
```dart
TableOptions(
  table: [
    ['1', '2', '3', '4', '5'],
    ['1.1', '1.2', '1.3', '1.4', '1.5'],
    ['2.1', '2.2', '2.3', '2.4', '2.5'],
    ['3.1', '3.2', '3.3', '3.4', '3.5'],
    ['4.1', '4.2', '4.3', '4.4', '4.5'],
  ]
)
..
...
..
DocumentBuilder<TableOptions>(builder: (context, options) => TableDoc(options: options))
```


# Add your custom widget 
```dart

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
```

### And use this
```dart
Document(
  options: [
    CustomElementOptions(
        icon: Icon(Icons.account_circle, size: 30,),
        text: 'The user has the right to be a user'
    )
  ],
  builders: [
    DocumentBuilder<CustomElementOptions>(
        builder: (context, options) => CustomElementWidget(options: options)
    ),
  ]
)
```