import 'package:client/screens/components/menu/side_bar/sidebar.dart';
import 'package:client/screens/split_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPageBuilder = ref.watch(selectedPageBuilderProvider);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplitView(
        menu: const Sidebar(),
        content: selectedPageBuilder(context),
      ),
    );
  }
}
