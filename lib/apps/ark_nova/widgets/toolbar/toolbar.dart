import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../../icons/ark_nova_icons.dart';

class Toolbar extends StatelessWidget {
  final void Function(String? value) setGameName;
  final double height;

  const Toolbar({
    super.key,
    required this.setGameName,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: SizedBox(
        height: height,
        child: Row(
          children: [
            Form(
              child: Expanded(
                child: TextField(
                  onChanged: setGameName,
                  style: TextStyle(
                    fontSize: 24,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Game Name',
                    border: InputBorder.none,
                    labelStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[500],
                    ),
                  ),
                ),
              ),
            ),
            Divider(
              indent: 10.0,
              endIndent: 10.0,
            ),
            Icon(
              Icons.settings,
              size: 32.0,
              color: Colors.black54,
            ),
          ],
        ),
      ),
    );
  }
}
