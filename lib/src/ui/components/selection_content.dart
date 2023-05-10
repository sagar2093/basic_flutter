import 'package:basic_flutter/res/dimens.dart';
import 'package:flutter/material.dart';

class SelectionContent extends StatelessWidget {
  const SelectionContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          _CheckboxContent(),
          Divider(),
          _ChipContent(),
          Divider(),
        ],
      ),
    );
  }
}

class _CheckboxContent extends StatefulWidget {
  const _CheckboxContent({Key? key}) : super(key: key);

  @override
  State<_CheckboxContent> createState() => _CheckboxContentState();
}

class _CheckboxContentState extends State<_CheckboxContent> {
  bool? cbChecked1 = false;
  bool? cbChecked2 = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    return Column(
      children: [
        Container(),
        const Text("Checkbox"),
        Checkbox(
            value: cbChecked1,
            onChanged: (value) {
              setState(() {
                cbChecked1 = value;
              });
            }),
        Checkbox(
          checkColor: Colors.white,
          fillColor: MaterialStateProperty.resolveWith(getColor),
          value: cbChecked2,
          onChanged: (bool? value) {
            setState(() {
              cbChecked2 = value;
            });
          },
        )
      ],
    );
  }
}

enum ExerciseFilter { walking, running, cycling, hiking }

class _ChipContent extends StatefulWidget {
  const _ChipContent({Key? key}) : super(key: key);

  @override
  State<_ChipContent> createState() => _ChipContentState();
}

class _ChipContentState extends State<_ChipContent> {
  bool favorite = false;
  int? _choiceValue = 1;

  // filter chip
  final List<String> _filters = <String>[];

  // input chip
  int inputs = 3;
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Chips"),
        gh8x2,
        Chip(
          avatar: CircleAvatar(
            backgroundColor: Colors.grey.shade400,
            child: const Text("AB"),
          ),
          label: const Text('Aaron Burr'),
        ),
        gh8x2,
        const Text("ActionChip"),
        ActionChip(
          avatar: Icon(favorite ? Icons.favorite : Icons.favorite_border),
          label: const Text('Save to favorites'),
          onPressed: () {
            setState(() {
              favorite = !favorite;
            });
          },
        ),
        gh8x2,
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Choose an item [Choice Chip]',
                style: Theme.of(context).textTheme.labelLarge),
            const SizedBox(height: 10.0),
            Wrap(
              spacing: 5.0,
              children: List<Widget>.generate(
                3,
                (int index) {
                  return ChoiceChip(
                    label: Text('Item $index'),
                    selected: _choiceValue == index,
                    onSelected: (bool selected) {
                      setState(() {
                        _choiceValue = selected ? index : null;
                      });
                    },
                  );
                },
              ).toList(),
            ),
          ],
        ),
        gh8x2,
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Choose an exercise [Filter Chip]', style: Theme.of(context).textTheme.labelLarge),
            const SizedBox(height: 5.0),
            Wrap(
              spacing: 5.0,
              children: ExerciseFilter.values.map((ExerciseFilter exercise) {
                return FilterChip(
                  label: Text(exercise.name),
                  selected: _filters.contains(exercise.name),
                  onSelected: (bool value) {
                    setState(() {
                      if (value) {
                        if (!_filters.contains(exercise.name)) {
                          _filters.add(exercise.name);
                        }
                      } else {
                        _filters.removeWhere((String name) {
                          return name == exercise.name;
                        });
                      }
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 10.0),
            Text('Looking for: ${_filters.join(', ')}')
          ],
        ),
        gh8x2,
        Text('Input Chip Sample', style: Theme.of(context).textTheme.labelLarge),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 5.0,
              children: List<Widget>.generate(
                inputs,
                    (int index) {
                  return InputChip(
                    label: Text('Person ${index + 1}'),
                    selected: selectedIndex == index,
                    onSelected: (bool selected) {
                      setState(() {
                        if (selectedIndex == index) {
                          selectedIndex = null;
                        } else {
                          selectedIndex = index;
                        }
                      });
                    },
                    onDeleted: () {
                      setState(() {
                        inputs = inputs - 1;
                      });
                    },
                  );
                },
              ).toList(),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  inputs = 3;
                });
              },
              child: const Text('Reset'),
            )
          ],
        )
      ],
    );
  }
}
