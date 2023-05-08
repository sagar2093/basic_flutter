import 'package:flutter/material.dart';

import '../../../res/dimens.dart';

class ButtonContent extends StatelessWidget {
  const ButtonContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: Dimens.contentPadding,
      children: [
        ElevatedButton(onPressed: () {}, child: const Text("Elevated")),
        ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: const Text("Elevated Icon")),
        gh8x2,
        FilledButton(onPressed: () {}, child: const Text("Filled")),
        FilledButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: const Text("Filled Icon")),
        FilledButton.tonal(onPressed: () {}, child: const Text("Filled Tonal")),
        gh8x2,
        OutlinedButton(onPressed: () {}, child: const Text("Outlined")),
        OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: const Text("Outlined")),
        gh8x2,
        TextButton(onPressed: () {}, child: const Text("Text")),
        TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: const Text("Text")),
      ],
    );
  }
}

class FabContent extends StatelessWidget {
  const FabContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: Dimens.contentPadding,
      children: [
        Column(
          children: [
            const Text("FloatingActionButton"),
            FloatingActionButton(
                onPressed: () {}, child: const Icon(Icons.add)),
            gh8x1,
            const Text("FAB Small"),
            FloatingActionButton.small(
                onPressed: () {}, child: const Icon(Icons.add)),
            gh8x1,
            const Text("FAB Large"),
            FloatingActionButton.large(
                onPressed: () {}, child: const Icon(Icons.add)),
            gh8x1,
            const Text("FAB Extended"),
            FloatingActionButton.extended(
              onPressed: () {},
              label: const Text("Extended"),
            ),
            gh8x1,
            const Text("FAB Extended Icon"),
            FloatingActionButton.extended(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text("Extended"),
            ),
            gh8x1,
            const Text("FAB Extended True"),
            FloatingActionButton.extended(
              onPressed: () {},
              isExtended: true,
              icon: const Icon(Icons.add),
              label: const Text("Extended"),
            ),
            gh8x1,
            const Text("FAB Extended False"),
            FloatingActionButton.extended(
              onPressed: () {},
              isExtended: false,
              icon: const Icon(Icons.add),
              label: const Text("Extended False"),
            ),
          ],
        )
      ],
    );
  }
}


