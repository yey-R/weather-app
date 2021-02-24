import 'package:flutter/material.dart';

class CurrentInfo extends StatelessWidget {
  final String imageName;
  final String title;
  final String value;

  CurrentInfo(
      {@required this.imageName, @required this.title, @required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 95,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage('icons/$imageName.png'),
              height: 50.0,
              color: Colors.black,
            ),
            SizedBox(width: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('$title'),
                Text('$value'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
