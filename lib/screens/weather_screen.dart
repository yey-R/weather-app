import 'package:app_design/models/hourly_info.dart';
import 'package:app_design/utilities/constants.dart';
import 'package:app_design/widgets/background.dart';
import 'package:app_design/widgets/current_info.dart';
import 'package:app_design/widgets/daily_info.dart';
import 'package:app_design/widgets/hourly_info.dart';
import 'package:app_design/widgets/more_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:app_design/widgets/search_box.dart';
import 'package:app_design/widgets/custom_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WeatherScreen extends StatefulWidget {
  final String location;
  final foreCastData;
  final oneCallData;
  final SharedPreferences userPref;

  WeatherScreen({
    @required this.foreCastData,
    @required this.oneCallData,
    @required this.location,
    @required this.userPref,
  });

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String location;
  HourlyInfo hourlyInfo;
  CurrentInfo currentInfo;
  MoreInfo moreInfo;
  DailyInfo dailyInfo;
  GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  void initState() {
    super.initState();
    _scaffoldKey = GlobalKey<ScaffoldState>();
    hourlyInfo = HourlyInfo(
      data: widget.oneCallData['hourly'],
      fun: update,
      ifMain: true,
      userPref: widget.userPref,
    );
    moreInfo = new MoreInfo(
      feelsLike: widget.oneCallData['current']['feels_like'].round(),
      wind: widget.oneCallData['current']['wind_speed'].round(),
      humidity: widget.oneCallData['current']['humidity'],
      isMetric: widget.userPref.getBool('metric'),
    );
    currentInfo = new CurrentInfo(
      description: widget.oneCallData['current']['weather'][0]['main'],
      temperature: widget.oneCallData['current']['temp'].round(),
      weatherCode: widget.oneCallData['current']['weather'][0]['id'],
      dayInSec: widget.oneCallData['current']['dt'],
      isMetric: widget.userPref.getBool('metric'),
    );
    dailyInfo = new DailyInfo(
      oneCallData:
          widget.oneCallData['daily'].sublist(1, widget.oneCallData.length),
      foreCastData: widget.foreCastData,
      margin: 550.0,
      userPref: widget.userPref,
    );
  }

  void update({WeatherInfoHourly data}) {
    setState(() {
      moreInfo = new MoreInfo(
        feelsLike: data.feelsLike,
        wind: data.windSpeed,
        humidity: data.humidity,
        isMetric: widget.userPref.getBool('metric'),
      );
      currentInfo = new CurrentInfo(
        description: data.description,
        temperature: data.temp,
        weatherCode: data.weatherCode,
        dayInSec: data.dayInSec,
        isMetric: widget.userPref.getBool('metric'),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      endDrawer: CustomDrawer(
        context: context,
        userPref: widget.userPref,
      ),
      body: Column(
        children: <Widget>[
          Stack(
            children: [
              Container(
                height: 600.0,
                width: double.infinity,
                decoration: mainBoxDecoration,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // BACKGROUND
                    Background(
                      weatherCode: currentInfo.weatherCode,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: kToolbarHeight,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 50.0,
                            ),
                            SearchBox(
                              location: widget.location,
                            ),
                            GestureDetector(
                              onTap: () {
                                _scaffoldKey.currentState.openEndDrawer();
                                print('Drawer button pressed');
                              },
                              child: Container(
                                width: 50.0,
                                height: 15.0,
                                padding: EdgeInsets.only(right: 8.0),
                                child: SvgPicture.asset(
                                  'assets/icons/menu/menu.svg',
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        // CURRENT INFO
                        currentInfo,
                      ],
                    ),
                    Positioned(
                      top: 295.0 + 30,
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                              '${DateFormat('EE, d MMM').format(
                                DateTime.fromMillisecondsSinceEpoch(
                                  currentInfo.dayInSec * 1000,
                                  isUtc: true,
                                ),
                              )}',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          // MORE INFO
                          moreInfo,
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 65.0,
                      child: Container(
                        height: 110.0,
                        width: MediaQuery.of(context).size.width,
                        child: hourlyInfo,
                        // HOURLY WEATHER
                      ),
                    ),
                  ],
                ),
              ),
              // DAILY WEATHER
              dailyInfo,
            ],
          ),
        ],
      ),
    );
  }
}
