import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  // not recommended to use; instead use routing from app.dart
  // builder: (context) => const SecondRoute()
  Future<dynamic> navigateToCustomScreen({required WidgetBuilder builder}) {
    return Navigator.push(
      this,
      MaterialPageRoute(builder: builder),
    );
  }

  Future<dynamic> navigateToDynamicScreen(String title, Widget content) {
    return navigateToCustomScreen(
        builder: (c) => DynamicScreen(title: title, content: content));
  }
}

class DynamicScreen extends StatelessWidget {
  const DynamicScreen({required this.title, required this.content, Key? key})
      : super(key: key);

  final String title;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SafeArea(child: content),
    );
  }
}
