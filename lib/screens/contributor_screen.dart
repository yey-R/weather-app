import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContributorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFdce9f2),
      appBar: AppBar(
        toolbarHeight: 56.0,
        elevation: 0,
        backgroundColor: Color(0xFF162343),
        centerTitle: true,
        title: Text(
          'Developers',
          style: TextStyle(color: Colors.white),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Image.asset('images/developer.png'),
          CircleAvatar(
            radius: 50.0,
            child: Image.asset('images/emre_yazici.png'),
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
                onTap: () => launch('https://www.instagram.com/yeyazici_/'),
              ),
              SizedBox(width: 10),
              InkWell(
                child: Icon(FontAwesomeIcons.patreon, size: 35.0),
                onTap: () => launch('https://www.instagram.com/yeyazici_/'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
