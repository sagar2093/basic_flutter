import 'package:basic_flutter/res/dimens.dart';
import 'package:basic_flutter/src/common/extensions/context_ext.dart';
import 'package:flutter/material.dart';

import 'date_picker_content.dart';
import 'menu_content.dart';

class SelectionContent extends StatelessWidget {
  const SelectionContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          _CheckboxContent(),
          Divider(),
          _ChipContent(),
          Divider(),
          DatePickerContent(),
          Divider(),
          MenuContent(),
          Divider(),
          RadioContent(),
          Divider(),
          SwitchContent(),
          Divider(),
          SliderContent(),
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
  bool? cbChecked3 = false;

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
        Text("Checkbox", style: Theme.of(context).textTheme.titleMedium),
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
        ),
        CheckboxListTile(
            value: cbChecked3,
            title: const Text("CheckboxListTile"),
            onChanged: (value) {
              setState(
                () {
                  cbChecked3 = value;
                },
              );
            }),
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
        Text("Chips", style: Theme.of(context).textTheme.titleMedium),
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
            Text('Choose an exercise [Filter Chip]',
                style: Theme.of(context).textTheme.labelLarge),
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
        Text('Input Chip Sample',
            style: Theme.of(context).textTheme.labelLarge),
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

enum SingingCharacter { lafayette, jefferson }

class RadioContent extends StatefulWidget {
  const RadioContent({super.key});

  @override
  State<RadioContent> createState() => _RadioContentState();
}

class _RadioContentState extends State<RadioContent> {
  SingingCharacter? _character = SingingCharacter.lafayette;
  SingingCharacter? _characterTile = SingingCharacter.lafayette;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text("Radio Button", style: Theme.of(context).textTheme.titleMedium),
        ListTile(
          title: const Text('Lafayette'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.lafayette,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Thomas Jefferson'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.jefferson,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        Text("RadioListTile", style: Theme.of(context).textTheme.titleMedium),
        RadioListTile(
          title: const Text('Lafayette'),
          value: SingingCharacter.lafayette,
          onChanged: (value) {
            setState(() {
              _characterTile = value;
            });
          },
          groupValue: _characterTile,
        ),
        RadioListTile(
          title: const Text('Thomas Jefferson'),
          value: SingingCharacter.jefferson,
          onChanged: (value) {
            setState(() {
              _characterTile = value;
            });
          },
          groupValue: _characterTile,
        ),
      ],
    );
  }
}

class SwitchContent extends StatefulWidget {
  const SwitchContent({super.key});

  @override
  State<SwitchContent> createState() => _SwitchContentState();
}

class _SwitchContentState extends State<SwitchContent> {
  bool light = true;
  bool light2 = true;

  bool switchValue1 = true;
  bool switchValue2 = true;
  bool switchValue3 = true;

  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Switch", style: Theme.of(context).textTheme.titleMedium),
        Switch(
          // This bool value toggles the switch.
          value: light,
          activeColor: Colors.red,
          onChanged: (bool value) {
            // This is called when the user toggles the switch.
            setState(() {
              light = value;
            });
          },
        ),
        Text("Switch with ThumbIcon",
            style: Theme.of(context).textTheme.titleMedium),
        Switch(
          value: light2,
          thumbIcon: thumbIcon,
          //activeColor: Colors.red,
          onChanged: (bool value) {
            // This is called when the user toggles the switch.
            setState(() {
              light2 = value;
            });
          },
        ),
        Text("SwitchListTile", style: Theme.of(context).textTheme.titleMedium),
        SwitchListTile(
          value: switchValue1,
          onChanged: (bool? value) {
            setState(() {
              switchValue1 = value!;
            });
          },
          title: const Text('Headline'),
          subtitle: const Text('Supporting text'),
        ),
        const Divider(height: 0),
        SwitchListTile(
          value: switchValue2,
          onChanged: (bool? value) {
            setState(() {
              switchValue2 = value!;
            });
          },
          title: const Text('Headline'),
          subtitle: const Text(
              'Longer supporting text to demonstrate how the text wraps and the switch is centered vertically with the text.'),
        ),
        const Divider(height: 0),
        SwitchListTile(
          value: switchValue3,
          onChanged: (bool? value) {
            setState(() {
              switchValue3 = value!;
            });
          },
          title: const Text('Headline'),
          subtitle: const Text(
              "Longer supporting text to demonstrate how the text wraps and how setting 'SwitchListTile.isThreeLine = true' aligns the switch to the top vertically with the text."),
          isThreeLine: true,
        ),
        const Divider(height: 0),
      ],
    );
  }
}

class SliderContent extends StatefulWidget {
  const SliderContent({Key? key}) : super(key: key);

  @override
  State<SliderContent> createState() => _SliderContentState();
}

class _SliderContentState extends State<SliderContent> {
  double _currentSliderValue1 = 20;

  double _currentSliderPrimaryValue = 0.2;
  double _currentSliderSecondaryValue = 0.5;

  RangeValues _currentRangeValues = const RangeValues(40, 80);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Sliders", style: Theme.of(context).textTheme.titleMedium),
        Slider(
          value: _currentSliderValue1,
          max: 100,
          divisions: 5,
          label: _currentSliderValue1.round().toString(),
          onChanged: (double value) {
            setState(() {
              _currentSliderValue1 = value;
            });
          },
        ),
        Slider(
          value: _currentSliderPrimaryValue,
          secondaryTrackValue: _currentSliderSecondaryValue,
          label: _currentSliderPrimaryValue.round().toString(),
          onChanged: (double value) {
            setState(() {
              _currentSliderPrimaryValue = value;
            });
          },
        ),
        Slider(
          value: _currentSliderSecondaryValue,
          label: _currentSliderSecondaryValue.round().toString(),
          onChanged: (double value) {
            setState(() {
              _currentSliderSecondaryValue = value;
            });
          },
        ),
        Text("RangeSlider", style: Theme.of(context).textTheme.titleMedium),
        RangeSlider(
          values: _currentRangeValues,
          max: 100,
          divisions: 5,
          labels: RangeLabels(
            _currentRangeValues.start.round().toString(),
            _currentRangeValues.end.round().toString(),
          ),
          onChanged: (RangeValues values) {
            setState(() {
              _currentRangeValues = values;
            });
          },
        )
      ],
    );
  }
}


