import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import '../../../classes/index.dart';
import 'new_player_form.dart';

class NewPlayerButton extends StatefulWidget {
  final void Function(String name, ColorItem color) addNewPlayer;
  final List<ColorItem> availableColors;

  const NewPlayerButton({
    super.key,
    required this.addNewPlayer,
    required this.availableColors,
  });

  @override
  State<NewPlayerButton> createState() => _NewPlayerButtonState();
}

class _NewPlayerButtonState extends State<NewPlayerButton> {
  late ColorItem currentColor;
  String name = '';
  String errorMessage = '';
  final TextEditingController _inputController = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      currentColor = widget.availableColors[0];
    });
  }

  void createNewPlayer() {
    if (name != '') {
      widget.addNewPlayer(name, currentColor);
      closePopup();
    } else {
      setState(() {
        errorMessage = 'Name cannot be empty';
      });
    }
  }

  void setName(String? newName) {
    if (newName is String) {
      setState(() {
        name = newName.length < 16 ? newName : newName.substring(0, 16);
      });
    }
  }

  void setColor(ColorItem? newColor) {
    if (newColor is ColorItem) {
      setState(() {
        currentColor = newColor;
      });
    }
  }

  void closePopup() {
    Navigator.of(context, rootNavigator: true).pop('dialog');
  }

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: Theme.of(context).primaryColor,
      borderType: BorderType.RRect,
      strokeWidth: 3.0,
      radius: Radius.circular(4.0),
      dashPattern: [10, 5],
      child: TextButton(
        key: ValueKey<String>(name + currentColor.name),
        style: ButtonStyle(
          minimumSize: MaterialStatePropertyAll<Size>(
              Size(double.infinity, double.infinity)),
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                  'New Player',
                  style: TextStyle(
                    color: Theme.of(context).primaryColorDark,
                  ),
                ),
                content: SizedBox(
                  height: 150.0,
                  child: NewPlayerForm(
                    key: ValueKey<String>(name + currentColor.name),
                    setName: setName,
                    setColor: setColor,
                    availableColors: widget.availableColors,
                    currentColor: currentColor,
                    controller: _inputController,
                  ),
                ),
                actions: [
                  Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ValueListenableBuilder<TextEditingValue>(
                        valueListenable: _inputController,
                        builder: (context, value, child) {
                          return ElevatedButton(
                            key: ValueKey<String>(name),
                            onPressed:
                                value.text.isNotEmpty ? createNewPlayer : null,
                            child: Text('OK'),
                          );
                        },
                      ),
                    ),
                  ),
                  Center(
                    child: TextButton(
                      onPressed: closePopup,
                      child: Text('Cancel'),
                    ),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(
          Icons.add,
          size: 32.0,
        ),
      ),
    );
  }
}
