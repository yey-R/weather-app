import 'package:flutter/material.dart';
import 'package:app_design/screens/custom_info_screen.dart';
import 'package:app_design/services/weather_forecast.dart';
import 'package:app_design/services/weather_onecall.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchBox extends StatefulWidget {
  final String location;

  SearchBox({@required this.location});

  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  String _location;
  String _nextLocation;

  @override
  void initState() {
    super.initState();
    _location = widget.location;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _location.length * 9.0 + 40.0,
      height: 40.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: Colors.white,
        boxShadow: kElevationToShadow[6],
      ),
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 16),
              child: TextField(
                showCursor: MediaQuery.of(context).viewInsets.bottom == 0
                    ? false
                    : true,
                decoration: InputDecoration(
                  hintText: _location,
                  hintStyle: TextStyle(
                    color: Colors.blue[500],
                  ),
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  _nextLocation = value;
                },
                onEditingComplete: () async {
                  SharedPreferences userPref =
                      await SharedPreferences.getInstance();
                  bool isMetric = userPref.getBool('metric');
                  var oneCallData = await WeatherOneCall(isMetric)
                      .getCityWeather(_nextLocation);
                  var foreCastData = await WeatherForeCast(isMetric)
                      .getCityWeather(_nextLocation);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return CustomInfoScreen(
                          foreCastData: foreCastData,
                          oneCallData: oneCallData,
                          userPref: userPref,
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            height: 40.0,
            width: 50.0,
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                borderRadius: BorderRadius.all(
                  Radius.circular(32),
                ),
                child: Container(
                  padding: EdgeInsets.only(top: 4.0),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.search,
                    size: 20.0,
                    color: Colors.blue[500],
                  ),
                ),
                onTap: () {
                  setState(() {});
                },
                onTapCancel: () {},
              ),
            ),
          )
        ],
      ),
    );
  }
}
