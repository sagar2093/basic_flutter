import 'package:flutter/material.dart';

class DynamicScreen extends StatelessWidget {
  const DynamicScreen({required this.title, required this.content, Key? key})
      : super(key: key);

  final String title;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SafeArea(
        child: content,
      ),
    );
  }
}
