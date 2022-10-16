// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:medftw/app_config/palette.dart';
import 'package:medftw/app_config/styles.dart';
import 'package:geolocator/geolocator.dart';
import 'package:medftw/app_screens/navmenu.dart';
import 'package:medftw/DataStorage.dart';

// import 'dart:convert'

// import 'package:medftw/app_screens/screens.dart';
// import 'package:medftw/app_screens/upcomingEvents.dart';

class PatientLogin extends StatefulWidget {
  @override
  _PatientLoginState createState() => _PatientLoginState();
}

class _PatientLoginState extends State<PatientLogin> {
  TextEditingController idController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF21BFBD),
        body: ListView(children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(top: 50.0, left: 15.0),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(100, 0, 10, 0),
            child: Header(),
          ),
          const SizedBox(height: 40.0),
          Container(
            padding: const EdgeInsets.only(top: 30, bottom: 60),
            height: MediaQuery.of(context).size.height * 0.73,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(100.0)),
            ),
            child: Column(children: [
              Padding(
                  padding:
                      EdgeInsets.only(top: 10, left: 30, right: 30, bottom: 20),
                  child: Text("Enter your ID to see your health data",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 25,
                      ))),
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.80,
                child: TextField(
                  controller: idController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'ID',
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 20)),
              _buildRegularButtonCard('Submit', Colors.lightBlue,
                  MediaQuery.of(context).size.width * 0.70, 50.0)
            ]),
          ),
        ]));
  }

  onClickSubmitButton() {
    print("onClick:" + idController.text);
    // if the text is not empty and the text inputted is a number
    if (idController.text.isNotEmpty &&
        int.tryParse(idController.text) != null) {
      DataStorage.id = int.parse(idController.text);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => BottomNavScreen(idController.text)));
    } else {
      print("Invalid text");
    }
  }

  Container _buildRegularButtonCard(
      String title, MaterialColor color, double width, double height) {
    return Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: SizedBox(
            width: width,
            height: height,
            child: TextButton(
                onPressed: () {
                  onClickSubmitButton();
                },
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 255, 255, 255)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            side: BorderSide(color: color))),
                    backgroundColor: MaterialStateProperty.all<Color>(color)),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      // const SizedBox(width: 100, height: 10),
                      Text(title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ))
                    ]))));
  }
}

Row Header() {
  return Row(
    children: <Widget>[
      SizedBox(width: 10.0),
      Text('Med',
          style: TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30.0)),
      SizedBox(width: 10),
      Text('For The Win',
          style: TextStyle(
              fontFamily: 'Montserrat', color: Colors.white, fontSize: 24.0))
    ],
  );
}

Expanded _buildButtonCard(String title, MaterialColor color, onClick) {
  return Expanded(
      child: Container(
          margin: const EdgeInsets.all(8.0),
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: SizedBox.expand(
              child: TextButton(
                  onPressed: () {
                    onClick;
                  },
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 255, 255, 255)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              side: BorderSide(color: color))),
                      backgroundColor: MaterialStateProperty.all<Color>(color)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        // const SizedBox(width: 100, height: 10),
                        Text(title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ))
                      ])))));
}

Expanded _buildStatCard(String title, String count, MaterialColor color) {
  return Expanded(
    child: Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            count,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}
