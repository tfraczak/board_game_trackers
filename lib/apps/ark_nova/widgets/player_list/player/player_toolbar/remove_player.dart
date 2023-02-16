import 'package:flutter/material.dart';

class RemovePlayer extends StatelessWidget {
  final String name;
  final Color color;
  final void Function() removePlayer;

  RemovePlayer({
    super.key,
    required this.name,
    required this.color,
    required this.removePlayer,
  });

  void closePopup(BuildContext dContext) {
    Navigator.of(dContext, rootNavigator: true).pop('dialog');
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: TextButton(
        style: ButtonStyle(
          alignment: Alignment.centerRight,
          shape: MaterialStatePropertyAll<CircleBorder>(CircleBorder()),
          iconColor: MaterialStatePropertyAll<Color>(Colors.black87),
          iconSize: MaterialStatePropertyAll<double>(18.0),
          padding:
              MaterialStatePropertyAll<EdgeInsetsGeometry>(EdgeInsets.all(3)),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          enableFeedback: true,
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext dContext) {
              return AlertDialog(
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Remove Player',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(height: 12.0),
                    Text(
                      name,
                      style: TextStyle(
                        color: color,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            width: 1.0,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        onPressed: () {
                          removePlayer();
                          closePopup(dContext);
                        },
                        child: Text('YES'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          closePopup(dContext);
                        },
                        child: Text('NO'),
                      )
                    ],
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.remove),
      ),
    );
  }
}
