import 'package:client/screens/components/menu/side_bar/sidebar.dart';
import 'package:client/screens/components/menu/top_bar/topbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/objectives/page_scaffold/page_scaffold.dart';

class FirstPage extends ConsumerWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentViewMode = ref.watch(currentViewModeProvider);
    return PageScaffold(
      title: 'First Page',
      body: Column(children: [const Text("First Page"), Text(currentViewMode)]),
    );
  }
}
