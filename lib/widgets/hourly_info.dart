import 'package:app_design/models/hourly_info.dart';
import 'package:app_design/widgets/hourly_info_box.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HourlyInfo extends StatefulWidget {
  final Function fun;
  final data;
  final bool ifMain;
  final int day;
  final SharedPreferences userPref;

  HourlyInfo({
    @required this.data,
    @required this.fun,
    @required this.ifMain,
    @required this.userPref,
    this.day,
  });

  @override
  _HourlyInfoState createState() => _HourlyInfoState();
}

class _HourlyInfoState extends State<HourlyInfo> {
  List<HourlyInfoBox> _data;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    widget.ifMain ? setData(widget.data) : setFutureData(widget.data);
  }

  void setData(dynamic weatherData) {
    _data = new List<HourlyInfoBox>();
    for (var data in weatherData) {
      WeatherInfoHourly hourlyModel = new WeatherInfoHourly(
        data,
        widget.ifMain,
      );
      HourlyInfoBox box = new HourlyInfoBox(
        data: hourlyModel,
        ifSelected: _data.length == 0 ? true : false,
        ifMain: widget.ifMain,
        isMetric: widget.userPref.getBool('metric'),
        is24h: widget.userPref.getBool('24h'),
      );
      if ((hourlyModel.day == DateTime.now().day &&
              hourlyModel.hour < DateTime.now().hour) ||
          hourlyModel.day < DateTime.now().day) {
        continue;
      }
      _data.add(box);
    }
  }

  void setFutureData(dynamic weatherData) {
    _data = new List<HourlyInfoBox>();
    for (var data in weatherData) {
      WeatherInfoHourly hourlyModel = new WeatherInfoHourly(
        data,
        widget.ifMain,
      );
      HourlyInfoBox box = new HourlyInfoBox(
        data: hourlyModel,
        ifSelected: false,
        ifMain: false,
        isMetric: widget.userPref.getBool('metric'),
        is24h: widget.userPref.getBool('24h'),
      );
      if (hourlyModel.day == widget.day) {
        _data.add(box);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return _data.length != 0
        ? ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _data.cast<Widget>().length,
            itemBuilder: (BuildContext context, int index) {
              return widget.ifMain
                  ? GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            HourlyInfoBox newBox = HourlyInfoBox(
                              data: _data[_selectedIndex].data,
                              ifSelected: false,
                              ifMain: true,
                              isMetric: widget.userPref.getBool('metric'),
                              is24h: widget.userPref.getBool('24h'),
                            );
                            _data[_selectedIndex] = newBox;
                            _selectedIndex = index;
                            newBox = HourlyInfoBox(
                              data: _data[_selectedIndex].data,
                              ifSelected: true,
                              ifMain: true,
                              isMetric: widget.userPref.getBool('metric'),
                              is24h: widget.userPref.getBool('24h'),
                            );
                            _data[_selectedIndex] = newBox;
                            widget.fun(data: newBox.data);
                          },
                        );
                      },
                      child: Container(
                        width: 70.0,
                        margin: EdgeInsets.only(right: 8.0),
                        child: _data.cast<Widget>()[index],
                      ),
                    )
                  : Container(
                      width: 70.0,
                      margin: EdgeInsets.only(right: 8.0),
                      child: _data.cast<Widget>()[index],
                    );
            },
          )
        : Container(
            width: double.infinity,
            child: Column(
              children: [
                Text(
                  'There is no hourly data yet',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
                Container(
                  height: 250.0,
                  child: Image.asset(
                    'assets/images/no_data.png',
                  ),
                ),
              ],
            ),
          );
  }
}
