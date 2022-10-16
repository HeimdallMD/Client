import 'package:client/screens/first_page/first_page.dart';
import 'package:client/screens/markdown_page/markdown_page.dart';
import 'package:client/screens/second_page/second_page.dart';
import 'package:flutter/cupertino.dart';

class Data {
  final availablePages = <String, WidgetBuilder>{
    'First Page': (_) => const FirstPage(),
    'Second Page': (_) => const SecondPage(),
    'Markdown Page': (_) => const MarkdownPage(),
  };

  final availableViewModes = <String>['Normal mode', 'Edit mode'];
}
