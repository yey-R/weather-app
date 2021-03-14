import 'package:app_design/screens/custom_info_screen.dart';
import 'package:app_design/widgets/daily_info_box.dart';
import 'package:flutter/material.dart';
import 'package:app_design/models/daily_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DailyInfo extends StatefulWidget {
  final oneCallData;
  final foreCastData;
  final double margin;
  final context;
  final WeatherInfoDaily currentInfo;
  final SharedPreferences userPref;

  DailyInfo({
    @required this.oneCallData,
    @required this.foreCastData,
    @required this.margin,
    @required this.userPref,
    this.context,
    this.currentInfo,
  });

  @override
  _DailyInfoState createState() => _DailyInfoState();
}

class _DailyInfoState extends State<DailyInfo> {
  List<DailyInfoBox> _data;

  @override
  void initState() {
    super.initState();
    setData(widget.oneCallData);
  }

  void setData(dynamic weatherData) {
    _data = new List<DailyInfoBox>();
    for (int index = 0; index < weatherData.length; index++) {
      int dayInSec = weatherData[index]['dt'];
      int weatherCode = weatherData[index]['weather'][0]['id'];
      int temperature = weatherData[index]['temp']['day'].round();

      Widget box = new DailyInfoBox(
        dayInSec: dayInSec,
        weatherCode: weatherCode,
        temperature: temperature,
        isMetric: widget.userPref.getBool('metric'),
      );
      _data.add(box);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height - 550,
      decoration: BoxDecoration(
        color: Color(0xFFd3d7e1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35.0),
          topRight: Radius.circular(35.0),
        ),
      ),
      margin: EdgeInsets.only(top: widget.margin),
      padding: EdgeInsets.only(
        top: 15.0,
      ),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(0.0),
              scrollDirection: Axis.vertical,
              itemCount: _data.cast<Widget>().length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    widget.context == null
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return CustomInfoScreen(
                                  foreCastData: widget.foreCastData,
                                  oneCallData: widget.oneCallData
                                          .sublist(0, index) +
                                      widget.oneCallData.sublist(
                                          index + 1, widget.oneCallData.length),
                                  currentData: widget.oneCallData[index],
                                  userPref: widget.userPref,
                                );
                              },
                            ),
                          )
                        : Navigator.pushReplacement(
                            widget.context,
                            MaterialPageRoute(
                              builder: (context) {
                                return CustomInfoScreen(
                                  foreCastData: widget.foreCastData,
                                  oneCallData: widget.oneCallData
                                          .sublist(0, index) +
                                      widget.oneCallData.sublist(
                                          index + 1, widget.oneCallData.length),
                                  currentData: widget.oneCallData[index],
                                  userPref: widget.userPref,
                                );
                              },
                            ),
                          );
                  },
                  child: Container(
                    width: 70.0,
                    child: _data.cast<Widget>()[index],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
