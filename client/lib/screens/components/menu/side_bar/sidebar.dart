import 'package:client/data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../objectives/page_list_tiles/page_list_tiles.dart';

final selectedPageNameProvider = StateProvider<String>((ref) {
  return Data().availablePages.keys.first;
});

void _selectPage(BuildContext context, WidgetRef ref, String pageName) {
  if (ref.read(selectedPageNameProvider.state).state != pageName) {
    ref.read(selectedPageNameProvider.state).state = pageName;
  }
  if (Scaffold.maybeOf(context)?.hasDrawer ?? false) {
    Navigator.of(context).pop();
  }
}

final selectedPageBuilderProvider = Provider<WidgetBuilder>((ref) {
  final selectedPageKey = ref.watch(selectedPageNameProvider.state).state;
  return Data().availablePages[selectedPageKey]!;
});

class Sidebar extends ConsumerWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPageName = ref.watch(selectedPageNameProvider.state).state;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Menu',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: ListView(
        children: <Widget>[
          for (var pageName in Data().availablePages.keys)
            PageListTile(
              selectedPageName: selectedPageName,
              pageName: pageName,
              onPressed: () {
                _selectPage(context, ref, pageName);
              },
            ),
        ],
      ),
    );
  }
}
