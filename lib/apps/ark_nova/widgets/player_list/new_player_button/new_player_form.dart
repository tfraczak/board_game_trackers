import 'package:flutter/material.dart';
import '../../../classes/index.dart';
import '../player_form/colors_dropdown.dart';
import '../player_form/name_input.dart';

class NewPlayerForm extends StatelessWidget {
  final void Function(String? value) setName;
  final void Function(ColorItem? value) setColor;
  final ColorItem currentColor;
  final List<ColorItem> availableColors;
  final TextEditingController controller;

  const NewPlayerForm({
    super.key,
    required this.setName,
    required this.setColor,
    required this.currentColor,
    required this.availableColors,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        NameInput(
          setName: setName,
          controller: controller,
        ),
        Divider(height: 10.0),
        ColorsDropdown(
          key: ValueKey<String>(currentColor.name),
          availableColors: availableColors,
          setColor: setColor,
          currentColor: currentColor,
        ),
      ],
    );
  }
}
