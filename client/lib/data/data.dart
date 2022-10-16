import 'package:client/screens/markdown_page/markdown_page.dart';
import 'package:flutter/cupertino.dart';

class Data {
  final availablePages = <String, WidgetBuilder>{
    'Markdown Page': (_) => const MarkdownPage(),
  };

  final availableViewModes = <String>['Normal mode', 'Edit mode'];
}
