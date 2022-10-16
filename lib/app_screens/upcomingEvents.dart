import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UpcomingEvents extends StatelessWidget {
  String patientName = "";
  UpcomingEvents(patientName);

  _launchURLmun() async {
    const url = 'https://munlist.com/';
    Uri uri = Uri(path: url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    var events = {
      1: "Bilkent Historical MUN",
      2: "IMPRINT MUN 3.0",
      3: "Middle Eastern MUN",
      4: "WORLD YOUTH CONVOCATION MUN",
      5: "IMMORTAL YOUTH MUN",
      6: "Orestecia Summit",
      7: "InterMUN",
      8: "Conrad Open Forum",
      9: "Stay At Home Model United Nations 2021",
      10: "International Crisis Summit MUN 2021"
    };
    return Scaffold(
      backgroundColor: Colors.pink,
      body: ListView(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 50.0)),
          Text(
            "Upcoming Events",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontFamily: "Montserrat",
            ),
          ),
          Padding(
              padding: EdgeInsets.only(
            top: 50.0,
          )),
          Text(
            "MUNs Available:",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontFamily: "Montserrat",
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 40.0)),
          Text(
            events[1].toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontFamily: "Montserrat",
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 30.0)),
          Text(
            events[2].toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontFamily: "Montserrat"),
          ),
          Padding(padding: EdgeInsets.only(bottom: 30.0)),
          Text(
            events[3].toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontFamily: "Montserrat"),
          ),
          Padding(padding: EdgeInsets.only(bottom: 30.0)),
          Text(
            events[4].toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontFamily: "Montserrat"),
          ),
          Padding(padding: EdgeInsets.only(bottom: 30.0)),
          Text(
            events[5].toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontFamily: "Montserrat"),
          ),
          Padding(padding: EdgeInsets.only(bottom: 30.0)),
          Text(
            events[6].toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontFamily: "Montserrat"),
          ),
          Padding(padding: EdgeInsets.only(bottom: 30.0)),
          Text(
            events[7].toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontFamily: "Montserrat"),
          ),
          Padding(padding: EdgeInsets.only(bottom: 30.0)),
          Text(
            events[8].toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontFamily: "Montserrat"),
          ),
          Padding(padding: EdgeInsets.only(bottom: 30.0)),
          Text(
            events[9].toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontFamily: "Montserrat"),
          ),
          Padding(padding: EdgeInsets.only(bottom: 30.0)),
          Text(
            events[10].toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontFamily: "Montserrat"),
          ),
          Padding(padding: EdgeInsets.only(bottom: 40.0)),
          Container(
              width: 125.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    alignment: Alignment.bottomLeft,
                    icon: Icon(Icons.add),
                    iconSize: 60,
                    color: Colors.green,
                    onPressed: _launchURLmun,
                  )
                ],
              )),
          Padding(padding: EdgeInsets.only(bottom: 40.0)),
        ],
      ),
    );
  }
}
