import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:app_design/screens/loading_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomDrawer extends StatefulWidget {
  final SharedPreferences userPref;
  final context;
  CustomDrawer({
    @required this.userPref,
    @required this.context,
  });

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool isMetric;
  bool is24h;

  @override
  void initState() {
    super.initState();
    setUserPref();
  }

  void setUserPref() async {
    setState(() {
      isMetric = widget.userPref.getBool('metric') ?? false;
      is24h = widget.userPref.getBool('24h') ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250.0,
      child: Drawer(
        child: Container(
          color: Color(0xFFdce9f2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset('assets/images/developer.png'),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                height: 100.0,
                alignment: Alignment.center,
                child: ToggleSwitch(
                  initialLabelIndex: isMetric ? 0 : 1,
                  minWidth: 110.0,
                  cornerRadius: 20.0,
                  activeBgColor: Colors.cyan,
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.grey,
                  inactiveFgColor: Colors.white,
                  labels: ['METRIC', 'IMPERIAL'],
                  onToggle: (index) {
                    if (index == 0) {
                      widget.userPref.setBool('metric', true);
                      Navigator.pushReplacement(
                        widget.context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LoadingScreen();
                          },
                        ),
                      );
                    } else {
                      widget.userPref.setBool('metric', false);
                      Navigator.pushReplacement(
                        widget.context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LoadingScreen();
                          },
                        ),
                      );
                    }
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                alignment: Alignment.center,
                child: ToggleSwitch(
                  initialLabelIndex: is24h ? 1 : 0,
                  minWidth: 110.0,
                  cornerRadius: 20.0,
                  activeBgColor: Colors.cyan,
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.grey,
                  inactiveFgColor: Colors.white,
                  labels: ['12hr', '24hr'],
                  onToggle: (index) {
                    if (index == 0) {
                      widget.userPref.setBool('24h', false);
                      Navigator.pushReplacement(
                        widget.context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LoadingScreen();
                          },
                        ),
                      );
                    } else {
                      widget.userPref.setBool('24h', true);
                      Navigator.pushReplacement(
                        widget.context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LoadingScreen();
                          },
                        ),
                      );
                    }
                  },
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      radius: 50.0,
                      child: Image.asset('assets/images/emre_yazici.png'),
                    ),
                    Text(
                      'Emre YAZICI',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20.0),
                    ),
                    SizedBox(height: 5),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          child: Icon(FontAwesomeIcons.github, size: 35.0),
                          onTap: () => launch('https://github.com/yey-R/'),
                        ),
                        SizedBox(width: 10),
                        InkWell(
                          child: Icon(FontAwesomeIcons.instagram, size: 35.0),
                          onTap: () =>
                              launch('https://www.instagram.com/yeyazici_/'),
                        ),
                        SizedBox(width: 10),
                        InkWell(
                          child: Icon(FontAwesomeIcons.patreon, size: 35.0),
                          onTap: () =>
                              launch('https://www.instagram.com/yeyazici_/'),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
