import 'package:client/screens/components/menu/top_bar/topbar.dart';
import 'package:flutter/material.dart';

class PageScaffold extends StatelessWidget {
  const PageScaffold({
    Key? key,
    required this.title,
    this.actions = const [],
    this.body,
    this.floatingActionButton,
  }) : super(key: key);
  final String title;
  final List<Widget> actions;
  final Widget? body;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    final ancestorScaffold = Scaffold.maybeOf(context);
    final hasDrawer = ancestorScaffold != null && ancestorScaffold.hasDrawer;
    return Scaffold(
      appBar: TopBar(
          leading: hasDrawer
              ? IconButton(
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    if (hasDrawer) {
                      ancestorScaffold.openDrawer();
                    } else {}
                  })
              : null),
      body: body,
      floatingActionButton: floatingActionButton,
    );
  }
}
