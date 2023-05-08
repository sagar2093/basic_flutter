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
}
