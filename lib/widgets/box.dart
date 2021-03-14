import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  final String title;
  final String icon;
  final String value;
  final String unit;

  Box({
    @required this.title,
    @required this.icon,
    @required this.value,
    @required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(right: 4.0, left: 8.0),
        height: 150.0,
        padding: EdgeInsets.only(top: 8.0),
        decoration: BoxDecoration(
          color: Color(0xFFC0CFF2),
          borderRadius: BorderRadius.all(
            Radius.circular(30.0),
          ),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/menu/$icon.png',
                  width: 60.0,
                  height: 60.0,
                  color: Colors.black,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    value,
                    style: TextStyle(fontSize: 40.0),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 6.0),
                  child: Text(
                    unit,
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
