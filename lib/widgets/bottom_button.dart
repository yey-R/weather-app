import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(7.0),
        child: Center(
          child: Text(
            'More Info',
            style: TextStyle(color: Colors.white),
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(
            Radius.circular(30.0),
          ),
        ),
      ),
    );
  }
}
