import 'package:app_design/widgets/daily_info.dart';
import 'package:app_design/widgets/hourly_info.dart';
import 'package:flutter/material.dart';
import 'package:app_design/models/daily_info.dart';
import 'package:app_design/utilities/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app_design/widgets/custom_box_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app_design/widgets/search_box.dart';
import 'package:app_design/widgets/custom_drawer.dart';

class CustomInfoScreen extends StatefulWidget {
  final foreCastData;
  final oneCallData;
  final currentData;
  final SharedPreferences userPref;

  CustomInfoScreen({
    @required this.foreCastData,
    @required this.userPref,
    this.oneCallData,
    this.currentData,
  });

  @override
  _CustomInfoScreenState createState() => _CustomInfoScreenState();
}

class _CustomInfoScreenState extends State<CustomInfoScreen> {
  String location = 'Ankara, Turkey';
  WeatherInfoDaily info;
  HourlyInfo hourlyInfo;
  DailyInfo dailyInfo;
  GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  void initState() {
    super.initState();
    _scaffoldKey = GlobalKey<ScaffoldState>();
    info = new WeatherInfoDaily(widget.currentData);
    hourlyInfo = new HourlyInfo(
      data: widget.foreCastData['list'],
      fun: null,
      ifMain: false,
      day:
          DateTime.fromMillisecondsSinceEpoch(info.dayInSec * 1000, isUtc: true)
              .day,
      userPref: widget.userPref,
    );
    dailyInfo = new DailyInfo(
      foreCastData: widget.foreCastData,
      oneCallData: widget.oneCallData,
      margin: 630.0,
      context: context,
      userPref: widget.userPref,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: CustomDrawer(
        context: context,
        userPref: widget.userPref,
      ),
      body: Stack(
        children: [
          Container(
            height: 500.0,
            decoration: mainBoxDecoration,
            child: Column(
              children: [
                SizedBox(
                  height: kToolbarHeight,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 50.0,
                      height: 15.0,
                    ),
                    SearchBox(
                      location: 'Yenimahalle, Ankara',
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
                  height: 10.0,
                ),
                Text(
                  info.getDay().substring(0, 3) + ', ' + info.getMonthAndDay(),
                  style: TextStyle(fontSize: 30.0, color: Colors.white),
                ),
                SizedBox(
                  height: hourlyInfo.day - DateTime.now().day <= 5 ? 20.0 : 5.0,
                ),
                Container(
                  height:
                      hourlyInfo.day - DateTime.now().day <= 5 ? 110.0 : 300.0,
                  child: hourlyInfo,
                ),
              ],
            ),
          ),
          CustomBoxInfo(
            userPref: widget.userPref,
            info: info,
          ),
          Container(),
          dailyInfo,
          Positioned(
            top: 615.0,
            child: Text(
              '\t\t\tUpcoming days',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ],
      ),
    );
  }
}
