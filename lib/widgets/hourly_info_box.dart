import 'package:app_design/models/hourly_info.dart';
import 'package:flutter/material.dart';
import 'package:app_design/models/icon_info.dart';
import 'package:intl/intl.dart';

class HourlyInfoBox extends StatelessWidget {
  final WeatherInfoHourly data;
  final bool ifSelected;
  final bool ifMain;
  final bool isMetric;
  final bool is24h;
  final Color _selectedColor = Color(0xFFd3d7e1);
  final Color _selectedTextColor = Color(0xFF11249F);

  HourlyInfoBox({
    @required this.ifSelected,
    @required this.data,
    @required this.ifMain,
    @required this.isMetric,
    @required this.is24h,
  });

  String getHour() {
    if (ifMain) {
      if (DateTime.now().day == data.day && DateTime.now().hour == data.hour) {
        return 'Now';
      } else if (DateTime.now().day + 1 == data.day && data.hour == 0) {
        return 'Tmw';
      } else if (DateTime.now().day + 2 == data.day && data.hour == 0) {
        return '${DateFormat('EE').format(DateTime.fromMillisecondsSinceEpoch(data.dayInSec * 1000, isUtc: true))}';
      }
    }
    if (is24h) {
      return '${[
        0,
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
      ].contains(data.hour) ? '0' + data.hour.toString() : data.hour}';
    } else {
      if (data.hour > 12) {
        return '${data.hour - 12}pm';
      } else if (data.hour == 12) {
        return '12pm';
      } else {
        return '${data.hour}am';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.0,
      padding: EdgeInsets.only(
        top: 3.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(30.0),
        ),
        color: ifSelected ? _selectedColor : Colors.white12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            getHour(),
            style: TextStyle(
              color: ifSelected ? _selectedTextColor : Colors.white,
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            isMetric ? '${data.temp}°C' : '${data.temp}°F',
            style: TextStyle(
                color: ifSelected ? _selectedTextColor : Colors.white,
                fontSize: 20.0),
          ),
          SizedBox(
            height: 10.0,
          ),
          IconInfo(
            hour: data.dayInSec,
          ).getIcon(
            data.weatherCode,
            ifSelected ? _selectedTextColor : Colors.white,
          ),
        ],
      ),
    );
  }
}
