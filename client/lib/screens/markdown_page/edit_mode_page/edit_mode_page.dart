import 'package:client/screens/components/objectives/page_scaffold/page_scaffold.dart';
import 'package:client/screens/markdown_page/markdown_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditModePage extends ConsumerStatefulWidget {
  const EditModePage({super.key});

  @override
  EditModePageState createState() => EditModePageState();
}

class EditModePageState extends ConsumerState<EditModePage> {
  late TextEditingController _textEditingController;
  late String text;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    text = ref.read(textProvider.state).state;
    _textEditingController.text = text;
  }

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Edit Page',
      body: TextField(
        maxLines: null,
        keyboardType: TextInputType.multiline,
        controller: _textEditingController,
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
        onChanged: (value) {
          setText(context, ref, value);
        },
      ),
    );
  }
}
