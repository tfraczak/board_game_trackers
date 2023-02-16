import 'package:flutter/material.dart';
import './widgets/player_list/player_list.dart';
import 'classes/index.dart';
import 'widgets/toolbar/toolbar.dart';

class ArkNova extends StatefulWidget {
  static String title = 'Ark Nova';
  final List<PlayerItem> playerList;

  const ArkNova({super.key, required this.playerList});

  @override
  State<ArkNova> createState() => _ArkNovaState();
}

class _ArkNovaState extends State<ArkNova> {
  String displayMode = 'light';
  String gameName = '';

  late double listHeight;
  late double listWidth;
  late double toolbarHeight = 64.0;

  void setGameName(String? value) {
    if (value is String) {
      setState(() {
        gameName = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Toolbar toolbar = Toolbar(setGameName: setGameName, height: toolbarHeight);
    Divider divider = Divider(thickness: 1.0, color: Colors.black12);
    return Center(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              toolbar,
              divider,
              PlayerList(
                key: ValueKey<String>('ark_nova_player_list'),
                toolbarHeight: toolbarHeight,
                playerList: widget.playerList,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
