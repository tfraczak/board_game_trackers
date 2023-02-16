import 'package:flutter/material.dart';
import '../../../classes/index.dart';
import '../../../constants/index.dart';

class ColorsDropdown extends StatefulWidget {
  final List<ColorItem> availableColors;
  final Function setColor;
  final ColorItem currentColor;

  const ColorsDropdown({
    super.key,
    required this.availableColors,
    required this.setColor,
    required this.currentColor,
  });

  @override
  State<ColorsDropdown> createState() => _ColorsDropdownState();
}

class _ColorsDropdownState extends State<ColorsDropdown> {
  final double itemHeight = 48.0;
  late ColorItem currentColor;
  List<ColorItem> availableColors = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      currentColor = widget.availableColors[0];
    });
  }

  List<DropdownMenuItem<ColorItem>> dropdownItems() {
    return widget.availableColors
        .map<DropdownMenuItem<ColorItem>>((ColorItem item) {
      return DropdownMenuItem<ColorItem>(
        value: item,
        child: Container(
          alignment: Alignment.center,
          constraints: BoxConstraints(minHeight: itemHeight),
          color: item.color,
          child: Text(
            item.name,
            style: TextStyle(
              color: fontColors[item.name],
            ),
          ),
        ),
      );
    }).toList();
  }

  void handleDropdownChange(ColorItem? item) {
    if (item is ColorItem) {
      widget.setColor(item);
      setState(() {
        currentColor = item;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        isExpanded: true,
        itemHeight: itemHeight,
        style: Theme.of(context).textTheme.titleLarge,
        value: currentColor,
        items: dropdownItems(),
        onChanged: handleDropdownChange,
        icon: SizedBox.shrink(),
      ),
    );
  }
}
