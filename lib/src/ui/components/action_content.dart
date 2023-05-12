import 'package:basic_flutter/res/dimens.dart';
import 'package:basic_flutter/src/ui/components/icon_button_content.dart';
import 'package:flutter/material.dart';

class ActionContent extends StatelessWidget {
  const ActionContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          ButtonContent(),
          Divider(),
          FabContent(),
          Divider(),
          IconButtonContent(),
          Divider(),
          IconButtonToggleContent(),
          Divider(),
          SegmentedButtonContent(),
          Divider(),
          ToggleButtonsSample(title: "Toggle Buttons")
        ],
      ),
    );
  }
}

class ButtonContent extends StatelessWidget {
  const ButtonContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      //padding: Dimens.contentPadding,
      children: [
        Text("Buttons", style: Theme.of(context).textTheme.titleMedium),
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          children: [
            Text("FAB", style: Theme.of(context).textTheme.titleMedium),
            gh8x2,
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

class SegmentedButtonContent extends StatelessWidget {
  const SegmentedButtonContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //Spacer(),
          Text("Segmented Button",
              style: Theme.of(context).textTheme.titleMedium),
          gh8x2,
          const Text('Single choice'),
          const SingleChoice(),
          gh8x2,
          const Text('Multiple choice'),
          const MultipleChoice(),
          //Spacer(),
        ],
      ),
    );
  }
}

enum Calendar { day, week, month, year }

class SingleChoice extends StatefulWidget {
  const SingleChoice({super.key});

  @override
  State<SingleChoice> createState() => _SingleChoiceState();
}

class _SingleChoiceState extends State<SingleChoice> {
  Calendar calendarView = Calendar.day;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Calendar>(
      segments: const <ButtonSegment<Calendar>>[
        ButtonSegment<Calendar>(
            value: Calendar.day,
            label: Text('Day'),
            icon: Icon(Icons.calendar_view_day)),
        ButtonSegment<Calendar>(
            value: Calendar.week,
            label: Text('Week'),
            icon: Icon(Icons.calendar_view_week)),
        ButtonSegment<Calendar>(
            value: Calendar.month,
            label: Text('Month'),
            icon: Icon(Icons.calendar_view_month)),
        ButtonSegment<Calendar>(
            value: Calendar.year,
            label: Text('Year'),
            icon: Icon(Icons.calendar_today)),
      ],
      selected: <Calendar>{calendarView},
      onSelectionChanged: (Set<Calendar> newSelection) {
        setState(() {
          // By default there is only a single segment that can be
          // selected at one time, so its value is always the first
          // item in the selected set.
          calendarView = newSelection.first;
        });
      },
    );
  }
}

enum Sizes { extraSmall, small, medium, large, extraLarge }

class MultipleChoice extends StatefulWidget {
  const MultipleChoice({super.key});

  @override
  State<MultipleChoice> createState() => _MultipleChoiceState();
}

class _MultipleChoiceState extends State<MultipleChoice> {
  Set<Sizes> selection = <Sizes>{Sizes.large, Sizes.extraLarge};

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Sizes>(
      segments: const <ButtonSegment<Sizes>>[
        ButtonSegment<Sizes>(value: Sizes.extraSmall, label: Text('XS')),
        ButtonSegment<Sizes>(value: Sizes.small, label: Text('S')),
        ButtonSegment<Sizes>(value: Sizes.medium, label: Text('M')),
        ButtonSegment<Sizes>(
          value: Sizes.large,
          label: Text('L'),
        ),
        ButtonSegment<Sizes>(value: Sizes.extraLarge, label: Text('XL')),
      ],
      selected: selection,
      onSelectionChanged: (Set<Sizes> newSelection) {
        setState(() {
          selection = newSelection;
        });
      },
      multiSelectionEnabled: true,
    );
  }
}

const List<Widget> fruits = <Widget>[
  Text('Apple'),
  Text('Banana'),
  Text('Orange')
];

const List<Widget> vegetables = <Widget>[
  Text('Tomatoes'),
  Text('Potatoes'),
  Text('Carrots')
];

const List<Widget> icons = <Widget>[
  Icon(Icons.sunny),
  Icon(Icons.cloud),
  Icon(Icons.ac_unit),
];

class ToggleButtonsSample extends StatefulWidget {
  const ToggleButtonsSample({super.key, required this.title});

  final String title;

  @override
  State<ToggleButtonsSample> createState() => _ToggleButtonsSampleState();
}

class _ToggleButtonsSampleState extends State<ToggleButtonsSample> {
  final List<bool> _selectedFruits = <bool>[true, false, false];
  final List<bool> _selectedVegetables = <bool>[false, true, false];
  final List<bool> _selectedWeather = <bool>[false, false, true];
  bool vertical = false;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton.icon(
          onPressed: () {
            setState(() {
              // When the button is pressed, ToggleButtons direction is changed.
              vertical = !vertical;
            });
          },
          label:
              Text("Toggle Buttons [${vertical ? 'Vertical' : 'Horizontal'}]"),
          icon: const Icon(Icons.screen_rotation_outlined),
        ),
        // ToggleButtons with a single selection.
        Text('Single-select', style: theme.textTheme.titleSmall),
        const SizedBox(height: 5),
        ToggleButtons(
          direction: vertical ? Axis.vertical : Axis.horizontal,
          onPressed: (int index) {
            setState(() {
              // The button that is tapped is set to true, and the others to false.
              for (int i = 0; i < _selectedFruits.length; i++) {
                _selectedFruits[i] = i == index;
              }
            });
          },
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          selectedBorderColor: Colors.red[700],
          selectedColor: Colors.white,
          fillColor: Colors.red[200],
          color: Colors.red[400],
          constraints: const BoxConstraints(
            minHeight: 40.0,
            minWidth: 80.0,
          ),
          isSelected: _selectedFruits,
          children: fruits,
        ),
        const SizedBox(height: 20),
        // ToggleButtons with a multiple selection.
        Text('Multi-select', style: theme.textTheme.titleSmall),
        const SizedBox(height: 5),
        ToggleButtons(
          direction: vertical ? Axis.vertical : Axis.horizontal,
          onPressed: (int index) {
            // All buttons are selectable.
            setState(() {
              _selectedVegetables[index] = !_selectedVegetables[index];
            });
          },
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          selectedBorderColor: Colors.green[700],
          selectedColor: Colors.white,
          fillColor: Colors.green[200],
          color: Colors.green[400],
          constraints: const BoxConstraints(
            minHeight: 40.0,
            minWidth: 80.0,
          ),
          isSelected: _selectedVegetables,
          children: vegetables,
        ),
        const SizedBox(height: 20),
        // ToggleButtons with icons only.
        Text('Icon-only', style: theme.textTheme.titleSmall),
        const SizedBox(height: 5),
        ToggleButtons(
          direction: vertical ? Axis.vertical : Axis.horizontal,
          onPressed: (int index) {
            setState(() {
              // The button that is tapped is set to true, and the others to false.
              for (int i = 0; i < _selectedWeather.length; i++) {
                _selectedWeather[i] = i == index;
              }
            });
          },
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          selectedBorderColor: Colors.blue[700],
          selectedColor: Colors.white,
          fillColor: Colors.blue[200],
          color: Colors.blue[400],
          isSelected: _selectedWeather,
          children: icons,
        ),
      ],
    );
  }
}
