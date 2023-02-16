import 'package:flutter/material.dart';
import '../../../../icons/ark_nova_icons.dart';
import 'dart:math' as math;

class ScoreTracker extends StatefulWidget {
  final String trackerType;
  final void Function(int) changeTrackerValue;
  final int? trackerValue;
  final double height;

  const ScoreTracker({
    super.key,
    required this.trackerType,
    required this.changeTrackerValue,
    required this.trackerValue,
    required this.height,
  });

  @override
  State<ScoreTracker> createState() => _ScoreTrackerState();
}

class _ScoreTrackerState extends State<ScoreTracker> {
  @override
  Widget build(BuildContext context) {
    double buttonRowHeight = widget.height / 4;
    double valueBoxHeight = widget.height / 2;
    Icon iconPicker(String value) {
      switch (value) {
        case '+1':
          return Icon(
            Icons.keyboard_arrow_up_sharp,
            color: Colors.black,
            size: buttonRowHeight,
          );
        case '+5':
          return Icon(
            Icons.keyboard_double_arrow_up_sharp,
            color: Colors.black,
            size: buttonRowHeight,
          );
        case '-1':
          return Icon(
            Icons.keyboard_arrow_down_sharp,
            color: Colors.black,
            size: buttonRowHeight,
          );
        case '-5':
          return Icon(
            Icons.keyboard_double_arrow_down_sharp,
            color: Colors.black,
            size: buttonRowHeight,
          );
        default:
          return Icon(
            Icons.face,
            color: Colors.black,
            size: buttonRowHeight,
          );
      }
    }

    AspectRatio buttonCreator(String value) {
      return AspectRatio(
        aspectRatio: 1,
        child: TextButton(
          style: ButtonStyle(
            alignment: Alignment.center,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            // iconSize: MaterialStatePropertyAll<double>(buttonRowHeight),
            // backgroundColor: MaterialStatePropertyAll<Color>(Colors.red),
            padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(
              EdgeInsets.all(0),
            ),
          ),
          onPressed: () {
            widget.changeTrackerValue(int.parse(value));
          },
          child: iconPicker(value),
        ),
      );
    }

    Widget icon = widget.trackerType == 'Appeal'
        ? Transform.rotate(
            angle: math.pi / 2,
            child: Icon(
              ArkNovaIcons.ticket,
              size: valueBoxHeight * 2,
              color: Color.fromARGB(255, 255, 175, 38),
            ),
          )
        : Icon(
            Icons.shield_outlined,
            size: valueBoxHeight * 2,
            color: Color.fromARGB(255, 86, 132, 33),
          );

    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                icon,
                Text(
                  '${widget.trackerValue}',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: valueBoxHeight,
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: buttonRowHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buttonCreator('+1'),
                  buttonCreator('+5'),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: buttonRowHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buttonCreator('-1'),
                  buttonCreator('-5'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
