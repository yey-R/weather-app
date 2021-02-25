import 'package:flutter/material.dart';
import 'package:weather_app/utilities/const.dart';
import 'package:weather_app/widgets/bottom_button.dart';
import 'package:weather_app/widgets/current_info.dart';

class WeatherScreen extends StatefulWidget {
  final data;
  WeatherScreen({this.data});
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String cityName;
  String description;
  String wind;
  String temperature;
  String feelsLike;
  String humidity;
  String indexUV;
  @override
  void initState() {
    super.initState();
    update(widget.data);
  }

  void update(dynamic data) {
    setState(() {
      cityName = data['city']['name'].toString().toUpperCase();
      description = data['list'][0]['weather'][0]['main'];
      wind = data['list'][0]['wind']['speed'].toStringAsFixed(0);
      temperature = data['list'][0]['main']['temp'].toStringAsFixed(0);
      feelsLike = data['list'][0]['main']['feels_like'].toStringAsFixed(0);
      humidity = data['list'][0]['main']['humidity'].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 56.0,
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          '$cityName',
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: null,
            child: Icon(Icons.attach_money_sharp),
            color: Colors.black,
          )
        ],
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: ListView(
        children: [
          Container(
            height: 764.0,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  '\t$description',
                  style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\t\t$temperature°C',
                  style: TextStyle(fontSize: 30.0),
                ),
                Image.asset(
                  'images/rainy_day_0.png',
                ),
                Container(
                  margin: EdgeInsets.only(left: 13, right: 13),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 1),
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          CurrentInfo(
                            imageName: 'wind',
                            title: 'WIND',
                            value: '$wind km/h',
                          ),
                          verticalLine,
                          CurrentInfo(
                            imageName: 'temp',
                            title: 'FEELS LIKE',
                            value: '$feelsLike°C',
                          ),
                        ],
                      ),
                      horizontalLine,
                      Row(
                        children: <Widget>[
                          CurrentInfo(
                            imageName: 'index_uv',
                            title: 'INDEX UV',
                            value: '2',
                          ),
                          verticalLine,
                          CurrentInfo(
                            imageName: 'humidity',
                            title: 'HUMIDITY',
                            value: '$humidity%',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                BottomButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
