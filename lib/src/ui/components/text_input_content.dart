import 'package:basic_flutter/res/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextInputContent extends StatelessWidget {
  const TextInputContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: Dimens.contentPadding,
        child: Column(
          children: [
            Text("TextField", style: Theme.of(context).textTheme.titleMedium),
            gh8x2,
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username',
              ),
              textInputAction: TextInputAction.next,
            ),
            gh8x2,
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
              textInputAction: TextInputAction.next,
            ),
            gh8x2,
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Phone',
              ),
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.done,
            ),
            gh8x2,
            const TextFields(),
          ],
        ),
      ),
    );
  }
}

class TextFields extends StatefulWidget {
  const TextFields({super.key});

  @override
  State<TextFields> createState() => _TextFieldsState();
}

class _TextFieldsState extends State<TextFields> {
  final TextEditingController _controllerFilled = TextEditingController();
  final TextEditingController _controllerOutlined = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextField(
          controller: _controllerFilled,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            suffixIcon: _ClearButton(controller: _controllerFilled),
            labelText: 'Filled',
            hintText: 'hint text',
            helperText: 'supporting text',
            filled: true,
          ),
        ),
        gh8x2,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: SizedBox(
                width: 200,
                child: TextField(
                  maxLength: 10,
                  maxLengthEnforcement: MaxLengthEnforcement.none,
                  controller: _controllerFilled,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: _ClearButton(controller: _controllerFilled),
                    labelText: 'Filled',
                    hintText: 'hint text',
                    helperText: 'supporting text',
                    filled: true,
                    errorText: 'error text',
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Flexible(
              child: SizedBox(
                width: 200,
                child: TextField(
                  controller: _controllerFilled,
                  enabled: false,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: _ClearButton(controller: _controllerFilled),
                    labelText: 'Disabled',
                    hintText: 'hint text',
                    helperText: 'supporting text',
                    filled: true,
                  ),
                ),
              ),
            ),
          ],
        ),
        gh8x2,
        TextField(
          controller: _controllerOutlined,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            suffixIcon: _ClearButton(controller: _controllerOutlined),
            labelText: 'Outlined',
            hintText: 'hint text',
            helperText: 'supporting text',
            border: const OutlineInputBorder(),
          ),
        ),
        gh8x2,
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Flexible(
            child: SizedBox(
              width: 200,
              child: TextField(
                controller: _controllerOutlined,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: _ClearButton(controller: _controllerOutlined),
                  labelText: 'Outlined',
                  hintText: 'hint text',
                  helperText: 'supporting text',
                  errorText: 'error text',
                  border: const OutlineInputBorder(),
                  filled: true,
                ),
              ),
            ),
          ),
          gh8x2,
          Flexible(
            child: SizedBox(
              width: 200,
              child: TextField(
                controller: _controllerOutlined,
                enabled: false,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: _ClearButton(controller: _controllerOutlined),
                  labelText: 'Dicsabled',
                  hintText: 'hint text',
                  helperText: 'supporting text',
                  border: const OutlineInputBorder(),
                  filled: true,
                ),
              ),
            ),
          ),
        ]),
      ],
    );
  }
}

class _ClearButton extends StatelessWidget {
  const _ClearButton({required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) => IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => controller.clear(),
      );
}
