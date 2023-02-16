import 'package:flutter/material.dart';
import 'apps/ark_nova/ark_nova.dart';

class BoardGameDropdown extends StatelessWidget {
  final String currentTracker;
  final void Function(String? value) changeTracker;

  BoardGameDropdown({
    super.key,
    required this.currentTracker,
    required this.changeTracker,
  });

  Color selectedColor(BuildContext context, String title) {
    return title == currentTracker
        ? Theme.of(context).primaryColorLight
        : Theme.of(context).primaryColorDark;
  }

  List<DropdownMenuItem<String>> items(BuildContext context) {
    return [
      DropdownMenuItem(
        value: 'default',
        child: Text(
          'Select a board game...',
          style: TextStyle(
            color: Theme.of(context).primaryColorLight,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w400,
            fontSize: 18.0,
          ),
        ),
      ),
      DropdownMenuItem(
        value: ArkNova.title,
        child: Text(
          ArkNova.title,
          style: TextStyle(
            color: selectedColor(context, ArkNova.title),
          ),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          onChanged: (String? value) {
            changeTracker(value);
          },
          iconEnabledColor: Theme.of(context).primaryColorLight,
          value: currentTracker,
          style: Theme.of(context).textTheme.titleLarge,
          items: items(context),
        ),
      ),
    );
  }
}
