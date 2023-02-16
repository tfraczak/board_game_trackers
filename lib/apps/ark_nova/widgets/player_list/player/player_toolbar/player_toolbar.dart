import 'package:flutter/material.dart';
import '../../../../classes/index.dart';
import './player_name.dart';
import './remove_player.dart';

class PlayerToolbar extends StatelessWidget {
  final String name;
  final double height;
  final ColorItem colorItem;
  final void Function() removePlayer;

  PlayerToolbar({
    super.key,
    required this.name,
    required this.height,
    required this.colorItem,
    required this.removePlayer,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PlayerName(name: name),
          RemovePlayer(
            name: name,
            color: colorItem.color,
            removePlayer: removePlayer,
          ),
        ],
      ),
    );
  }
}
