import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MarkdownPage extends StatefulWidget {
  String mode;
  MarkdownPage({super.key, required this.mode});

  @override
  State<MarkdownPage> createState() => _MarkdownPageState();
}

class _MarkdownPageState extends State<MarkdownPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const Text("Markdown Page"),
        Text(widget.mode),
      ]),
    );
  }
}
