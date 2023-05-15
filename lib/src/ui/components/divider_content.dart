import 'package:basic_flutter/res/dimens.dart';
import 'package:flutter/material.dart';

class DividerContent extends StatelessWidget {
  const DividerContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          gh8x2,
          const Divider(),
          gh8x2,
          SizedBox(
            height: 200,
            child: Center(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      color: Colors.amber,
                      child: const Center(
                        child: Text('Above'),
                      ),
                    ),
                  ),
                  const Divider(
                    height: 20,
                    thickness: 5,
                    indent: 20,
                    endIndent: 0,
                    color: Colors.black,
                  ),
                  // Subheader example from Material spec.
                  // https://material.io/components/dividers#types
                  /*Container(
                    padding: const EdgeInsets.only(left: 20),
                    child: Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        'Subheader',
                        style: Theme.of(context).textTheme.bodySmall,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),*/
                  Expanded(
                    child: Container(
                      color: Theme.of(context).colorScheme.primary,
                      child: const Center(
                        child: Text('Below'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          gh8x2,
          SizedBox(
            height: 200,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: const <Widget>[
                    Text("Divider between cards"),
                    Expanded(
                      child: Card(
                        child: SizedBox.expand(),
                      ),
                    ),
                    Divider(),
                    Expanded(
                      child: Card(
                        child: SizedBox.expand(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          gh8x2,
          const Text("VerticalDivider"),
          const SizedBox(height: 100, child: VerticalDivider()),
          gh8x2,
          const Text("ListTile.dividerTiles()"),
          Column(
            children: [
              ...ListTile.divideTiles(
                  context: context,
                  tiles: List.generate(
                      5, (index) => ListTile(title: Text("Item $index")))),
            ],
          ),
          gh8x2,
        ],
      ),
    );
  }
}
