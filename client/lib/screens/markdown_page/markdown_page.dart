import 'package:client/data/data.dart';
import 'package:client/screens/components/menu/top_bar/topbar.dart';
import 'package:client/screens/markdown_page/edit_mode_page/edit_mode_page.dart';
import 'package:client/screens/markdown_page/normal_mode_page/normal_mode_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final textProvider = StateProvider<String>((ref) {
  return "Input Text";
});

final getText = Provider<String>((ref) {
  final currentText = ref.watch(textProvider.state).state;
  return currentText;
});

void setText(BuildContext context, WidgetRef ref, String text) {
  ref.read(textProvider.state).state = text;
}

class MarkdownPage extends ConsumerWidget {
  const MarkdownPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentViewMode = ref.watch(currentViewModeProvider);
    if (currentViewMode == Data().availableViewModes.first) {
      return const NormalModePage();
    } else {
      return const EditModePage();
    }
  }
}
