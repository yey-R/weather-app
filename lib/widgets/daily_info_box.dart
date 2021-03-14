import 'package:app_design/models/icon_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class DailyInfoBox extends StatefulWidget {
  final int dayInSec;
  final int weatherCode;
  final int temperature;
  final bool isMetric;

  DailyInfoBox({
    @required this.dayInSec,
    @required this.weatherCode,
    @required this.temperature,
    @required this.isMetric,
  });

  @override
  _DailyInfoBoxState createState() => _DailyInfoBoxState();
}

class _DailyInfoBoxState extends State<DailyInfoBox> {
  String getDay() {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(widget.dayInSec * 1000);
    return DateFormat('EEEE').format(date);
  }

  String getDate() {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(widget.dayInSec * 1000);
    return '${date.day} ${DateFormat('MMMM').format(date).substring(0, 3)} ${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: 12.0,
        left: 12.0,
        top: 6.0,
      ),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Color(0xFFC0CFF2),
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                getDay(),
                style: TextStyle(fontSize: 25.0),
              ),
              Text(
                getDate(),
              ),
            ],
          ),
          Container(
            width: 150.0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  child: IconInfo(hour: -1)
                      .getIcon(widget.weatherCode, Colors.white),
                  radius: 20.0,
                ),
                SizedBox(
                  width: 20.0,
                ),
                Container(
                  width: 50.0,
                  alignment: Alignment.center,
                  child: Text(
                    widget.isMetric
                        ? '${widget.temperature}°C'
                        : '${widget.temperature}°F',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                SvgPicture.asset('assets/icons/menu/forward.svg')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
