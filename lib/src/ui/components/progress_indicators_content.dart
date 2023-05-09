import 'package:basic_flutter/res/dimens.dart';
import 'package:flutter/material.dart';

class ProgressIndicatorsContent extends StatelessWidget {
  const ProgressIndicatorsContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LinearProgressIndicator(),
        gh8x2,
        CircularProgressIndicator(),
      ],
    );
  }
}
