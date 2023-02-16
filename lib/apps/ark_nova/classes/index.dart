import 'dart:developer';

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
  dynamic _player;
  Map<String, int> _playerState = {'appeal': 0, 'conservation': 0};

  PlayerItem({
    required this.name,
    required this.colorItem,
  });

  Player getOrBuildPlayer({
    required double height,
    required double width,
    required void Function(String) removePlayer,
  }) {
    bool playerExists = _player != null;
    if (playerExists) return _player;

    _player = Player(
      name: name,
      colorItem: colorItem,
      height: height,
      width: width,
      removePlayer: removePlayer,
      playerState: _playerState,
    );
    return _player;
  }

  Player rebuildPlayer({
    required int index,
    required double height,
    required double width,
    required void Function(String) removePlayer,
  }) {
    _player = Player(
      name: name,
      colorItem: colorItem,
      height: height,
      width: width,
      removePlayer: removePlayer,
      playerState: _playerState,
    );
    return _player;
  }

  String key() {
    return colorItem.name + name;
  }
}
