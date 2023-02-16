import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../../../../icons/ark_nova_icons.dart';
import '../../../../constants/index.dart' show appealData, conservationData;
import 'score_tracker.dart';

class TrackerData extends StatelessWidget {
  final double height;
  final int appeal;
  final int conservation;
  final void Function(int) changeAppeal;
  final void Function(int) changeConservation;

  TrackerData({
    super.key,
    required this.height,
    required this.appeal,
    required this.conservation,
    required this.changeAppeal,
    required this.changeConservation,
  });

  SizedBox dataBox(String dataType) {
    bool forIncome = dataType == 'Income';
    int data = forIncome
        ? appealData[appeal]!['income']
        : conservationData[conservation]!['lowestAppeal'];
    Widget icon = forIncome
        ? Icon(ArkNovaIcons.dollarSign, color: Color.fromARGB(150, 0, 150, 0))
        : SizedBox(
            height: height / 2,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Transform.rotate(
                  angle: 3 * math.pi / 4,
                  child: Icon(
                    ArkNovaIcons.ticket,
                    color: Color.fromARGB(255, 92, 63, 0),
                  ),
                ),
                Positioned(
                  top: 24,
                  child: Icon(Icons.arrow_drop_down),
                ),
              ],
            ));
    Text text = Text('$data', style: TextStyle(fontSize: height / 4));
    return SizedBox(
      height: height / 2,
      width: double.infinity,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            text,
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext lContext, BoxConstraints constraints) {
        return Row(
          children: [
            SizedBox(
              height: height,
              width: 2 * constraints.maxWidth / 5,
              child: ScoreTracker(
                trackerType: 'Appeal',
                changeTrackerValue: changeAppeal,
                height: height,
                trackerValue: appeal,
              ),
            ),
            SizedBox(
              width: constraints.maxWidth / 5,
              height: height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  dataBox('Income'),
                  dataBox('Lowest Appeal'),
                ],
              ),
            ),
            SizedBox(
              height: height,
              width: 2 * constraints.maxWidth / 5,
              child: ScoreTracker(
                trackerType: 'Conservation',
                changeTrackerValue: changeConservation,
                height: height,
                trackerValue: conservation,
              ),
            ),
          ],
        );
      },
    );
  }
}
