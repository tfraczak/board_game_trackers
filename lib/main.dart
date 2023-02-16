import 'package:flutter/material.dart';
import 'apps/ark_nova/ark_nova.dart';
import './board_game_dropdown.dart';
import './apps/ark_nova/classes/index.dart';

void main() {
  runApp(const BoardGameTrackerApp());
}

class BoardGameTrackerApp extends StatefulWidget {
  const BoardGameTrackerApp({super.key});

  @override
  State<BoardGameTrackerApp> createState() => _BoardGameTrackerAppState();
}

class _BoardGameTrackerAppState extends State<BoardGameTrackerApp> {
  String currentTracker = 'default';
  static List<PlayerItem> playerList = [];

  void changeTracker(String? value) {
    if (value is String) {
      setState(() {
        currentTracker = value;
      });
    }
  }

  Map<String, Widget> trackerMap = {
    'default': SizedBox.shrink(),
    ArkNova.title: ArkNova(playerList: playerList),
  };

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp(
        title: 'Board Game Tracker',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: BoardGameDropdown(
              key: ValueKey<String>(currentTracker),
              currentTracker: currentTracker,
              changeTracker: changeTracker,
            ),
          ),
          body: trackerMap[currentTracker],
        ),
      ),
    );
  }
}
