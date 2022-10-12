import 'package:flutter/material.dart';
import '../components/sidebar/sidebar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Row(children: [
        const Expanded(child: Sidebar()),
        Expanded(
          flex: 5,
          child: Container(color: Colors.grey.shade100),
        ),
      ])),
    );
  }
}
