import 'package:flutter/material.dart';
import '../widgets/player_list/player/player.dart' show Player;

class ColorItem {
  final String name;
  final Color color;

  ColorItem({required this.name, required this.color});
}

class PlayerItem {
  final String name;
  final ColorItem colorItem;

  PlayerItem({
    required this.name,
    required this.colorItem,
  });

  Player build({
    required int index,
    required double height,
    required double width,
    required void Function(String) removePlayer,
  }) {
    return Player(
      name: name,
      index: index,
      colorItem: colorItem,
      height: height,
      width: width,
      removePlayer: removePlayer,
    );
  }

  String key() {
    return colorItem.name + name;
  }
}
