import 'package:basic_flutter/res/dimens.dart';
import 'package:flutter/material.dart';

class BottomSheetContent extends StatelessWidget {
  const BottomSheetContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(),
        gh8x2,
        ElevatedButton(
            onPressed: () {
              showBottomSheet(
                  context: context,
                  builder: (c) {
                    return const SizedBox(
                      height: 200,
                      child: Center(child: Text("BottomSheet Content")),
                    );
                  });
            },
            child: const Text("BottomSheet")),
        gh8x2,
        ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (c) {
                    return const SizedBox(
                      height: 200,
                      child: Center(child: Text("Modal BottomSheet Content")),
                    );
                  });
            },
            child: const Text("Modal BottomSheet")),
        gh8x2,
      ],
    );
  }
}
