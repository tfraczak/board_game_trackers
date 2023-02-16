import 'package:flutter/material.dart';
import '../../classes/index.dart' show ColorItem, PlayerItem;
import '../../constants/index.dart' show colors;
import 'new_player_button/new_player_button.dart' show NewPlayerButton;

class PlayerList extends StatefulWidget {
  final double toolbarHeight;
  final List<PlayerItem> playerList;

  const PlayerList({
    super.key,
    required this.toolbarHeight,
    required this.playerList,
  });

  @override
  State<PlayerList> createState() => _PlayerListState();
}

class _PlayerListState extends State<PlayerList> {
  late List<PlayerItem> playerList;

  @override
  void initState() {
    setState(() {
      playerList = widget.playerList;
    });
    super.initState();
  }

  void addPlayer(String name, ColorItem colorItem) {
    PlayerItem newPLayerItem = PlayerItem(name: name, colorItem: colorItem);
    setState(() {
      playerList.add(newPLayerItem);
    });
  }

  void removePlayer(String playerKey) {
    setState(() {
      playerList.removeWhere((PlayerItem pI) => pI.key() == playerKey);
    });
  }

  List<ColorItem> availableColors() {
    List<ColorItem> list = [];
    for (ColorItem colorItem in colors) {
      bool hasColor = playerList
          .any((PlayerItem pI) => pI.colorItem.name == colorItem.name);
      if (!hasColor) {
        list.add(colorItem);
      }
    }
    return list;
  }

  String colorsKey() {
    return availableColors().join(',');
  }

  String playersKey() {
    return playerList.map((pI) => pI.key()).join(',');
  }

  ValueKey valueKey() {
    return ValueKey<String>(colorsKey() + playersKey());
  }

  List<Widget> children(double listHeight, double listWidth) {
    List<Widget> list = [];
    double playerHeight = (listHeight / 4) - 9;
    for (var i = 0; i < playerList.length; i++) {
      list.add(playerList[i].build(
        index: i,
        height: playerHeight,
        width: listWidth,
        removePlayer: removePlayer,
      ));
      if (i != playerList.length - 1) {
        list.add(Divider(height: 12.0));
      }
    }
    if (playerList.length < 4) {
      return [
        ...list,
        Divider(height: 12.0),
        SizedBox(
          height: playerHeight,
          child: NewPlayerButton(
            key: valueKey(),
            addNewPlayer: addPlayer,
            availableColors: availableColors(),
          ),
        )
      ];
    } else {
      return list;
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double paddingHeight = MediaQuery.of(context).padding.top +
        MediaQuery.of(context).padding.bottom;
    double appBarHeight = Scaffold.of(context).appBarMaxHeight as double;
    double height = screenHeight -
        paddingHeight -
        kToolbarHeight -
        widget.toolbarHeight -
        appBarHeight;
    double width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.left -
        MediaQuery.of(context).padding.right;
    return SizedBox(
      height: height,
      child: ListView(
        key: valueKey(),
        children: children(height, width),
      ),
    );
  }
}
