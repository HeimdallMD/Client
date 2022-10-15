import 'package:flutter/material.dart';

class MarkdownTextField extends StatelessWidget {
  final int maxLines;
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final Function(String) onChanged;
  final bool autofocus;

  const MarkdownTextField({
    Key? key,
    required this.maxLines,
    required this.controller,
    required this.onChanged,
    required this.textInputAction,
    required this.autofocus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        cursorColor: Colors.cyan[700],
        controller: controller,
        // ignore: unnecessary_null_comparison
        autofocus: (autofocus != null) ? autofocus : true,
        // ignore: unnecessary_null_comparison
        textInputAction: (textInputAction != null)
            ? textInputAction
            : TextInputAction.newline,
        keyboardType: TextInputType.multiline,
        // ignore: unnecessary_null_comparison
        maxLines: (maxLines != null) ? maxLines : 99999,
        onChanged: onChanged,
      ),
    );
  }

  void wrapWith({required String leftSide, required String rightSide}) {
    final text = controller.value.text;
    final selection = controller.selection;
    final middle = selection.textInside(text);
    final newText =
        '${selection.textBefore(text)}$leftSide$middle$rightSide${selection.textAfter(text)}';

    controller.value = controller.value.copyWith(
      text: newText,
      selection: TextSelection.collapsed(
        offset: selection.baseOffset + leftSide.length + middle.length,
      ),
    );
  }
}
