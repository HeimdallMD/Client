import 'package:flutter/cupertino.dart';

class MarkdownFile {
  late String uuid;
  late String name;
  late String sourcePath;

  MarkdownFile(this.name, this.sourcePath) {
    uuid = UniqueKey().toString();
  }
}
