import 'package:flutter/material.dart';
import '../../../classes/index.dart';
import 'player_toolbar/player_toolbar.dart';
import './tracker_data/tracker_data.dart';

class Player extends StatefulWidget {
  final String name;
  final int index;
  final ColorItem colorItem;
  final double height;
  final double width;
  final void Function(String) removePlayer;

  Player({
    super.key,
    required this.name,
    required this.index,
    required this.colorItem,
    required this.height,
    required this.width,
    required this.removePlayer,
  });

  String playerKey() => colorItem.name + name;

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  int appeal = 0;
  int conservation = 0;
  int income = 0;
  late String name;

  @override
  void initState() {
    setState(() {
      name = widget.name;
    });
    super.initState();
  }

  void changeName(String? newName) {
    if (newName is String) {
      setState(() {
        name = newName;
      });
    }
  }

  Color backgroundColor(String colorName) {
    switch (colorName) {
      case 'red':
        return Color.fromARGB(255, 255, 206, 211);
      case 'blue':
        return Color.fromARGB(255, 189, 226, 255);
      case 'yellow':
        return Color.fromARGB(255, 255, 249, 196);
      case 'black':
        return Color.fromARGB(255, 208, 208, 208);
      default:
        return Colors.white;
    }
  }

  void changeAppeal(int value) {
    setState(() {
      int newAppeal = appeal + value;
      if (newAppeal < 0) {
        appeal = 0;
      } else if (newAppeal > 113) {
        appeal = 113;
      } else {
        appeal = newAppeal;
      }
    });
  }

  void changeConservation(int value) {
    setState(() {
      int newConservation = conservation + value;
      if (newConservation < 0) {
        conservation = 0;
      } else if (newConservation > 41) {
        conservation = 41;
      } else {
        conservation = newConservation;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double toolbarHeight = 24.0;
    double padding = 6.0;
    double borderWidth = 4.0;
    double trackerDataHeight =
        widget.height - toolbarHeight - (2 * padding) - (2 * borderWidth);
    return SizedBox(
      height: widget.height,
      child: Container(
        width: widget.width,
        decoration: BoxDecoration(
          color: widget.colorItem.color,
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          border: Border.all(
            color: widget.colorItem.color,
            width: borderWidth,
          ),
        ),
        child: Container(
          width: widget.width,
          decoration: BoxDecoration(
            color: backgroundColor(widget.colorItem.name),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          child: Padding(
            padding: EdgeInsets.all(padding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                PlayerToolbar(
                  name: widget.name,
                  colorItem: widget.colorItem,
                  removePlayer: () => widget.removePlayer(widget.playerKey()),
                  height: toolbarHeight,
                ),
                TrackerData(
                  key: ValueKey<double>(trackerDataHeight),
                  height: trackerDataHeight,
                  changeAppeal: changeAppeal,
                  changeConservation: changeConservation,
                  appeal: appeal,
                  conservation: conservation,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
