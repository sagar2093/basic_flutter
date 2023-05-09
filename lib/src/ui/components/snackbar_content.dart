
import 'package:flutter/material.dart';

class SnackbarContent extends StatelessWidget {
  const SnackbarContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('Show Snackbar'),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Awesome Snackbar!'),
              action: SnackBarAction(
                label: 'Action',
                onPressed: () {
                  // Code to execute.
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
