import 'package:client/screens/components/objectives/page_scaffold/page_scaffold.dart';
import 'package:client/screens/markdown_page/markdown_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NormalModePage extends ConsumerStatefulWidget {
  const NormalModePage({super.key});

  @override
  NormalModePageState createState() => NormalModePageState();
}

class NormalModePageState extends ConsumerState {
  late String text = "<404> Not Found";

  @override
  void initState() {
    super.initState();
    text = ref.read(textProvider.state).state;
  }

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Normal Page',
      body: MarkdownBody(data: text),
    );
  }
}
