import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final int weatherCode;

  Background({@required this.weatherCode});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600.0,
      child: Image.asset(
        'assets/backgrounds/sunlight_left.png',
        color: Colors.white,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
