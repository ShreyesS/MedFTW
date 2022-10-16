import 'package:flutter/material.dart';
import 'package:medftw/app_config/palette.dart';
import 'package:medftw/app_config/styles.dart';
import 'package:geolocator/geolocator.dart';
import 'package:medftw/DataStorage.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

// import 'dart:convert'

// import 'package:medftw/app_screens/screens.dart';
// import 'package:medftw/app_screens/upcomingEvents.dart';

class HomeScreen extends StatefulWidget {
  String patientName = "";
  HomeScreen(patientName);

  @override
  _HomeScreenState createState() {
    print("Homescreen" + patientName);
    return _HomeScreenState();
  }
}

class Person {
  String name = "";
  Person(String name) {
    this.name = name;
  }
}

class _HomeScreenState extends State<HomeScreen> {
  String base64 = '';

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  Future<String> getNameRequest() async {
    String url =
        "https://medftwserver.herokuapp.com/getnamefromid/" + DataStorage.id.toString();
    Uri uri = Uri.parse(url);
    final response = await http.get(uri);
    print(response.body);
    Map<String, dynamic> map = json.decode(response.body);
    return map["name"];
  }

  Future<String> getRequest() async {
    print("Test print");
    //replace your restFull API here.
    String url =
        "https://medftwserver.herokuapp.com/getlocation/" + DataStorage.name;
    Uri uri = Uri.parse(url);
    final response = await http.get(uri);
    print(response.body);
    Map<String, dynamic> map = json.decode(response.body);
    print(map["name"]);
    // Person responseData = json.decode(response.body);

    // print("Response data: " + responseData.name);
    //Creating a list to store input data;
    // List<User> users = [];
    // for (var singleUser in responseData) {
    //   User user = User(
    //       id: singleUser["id"],
    //       userId: singleUser["userId"],
    //       title: singleUser["title"],
    //       body: singleUser["body"]);

    //   //Adding user to the list.
    //   users.add(user);
    // }
    return map["name"];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: do getrequest
    // print("Get Request: " + getRequest());
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
                borderRadius:
                    BorderRadius.only(topLeft: Radius.circular(100.0)),
              ),
              child: Column(children: Buttons())),
          FutureBuilder(
              future: getRequest(),
              builder: (BuildContext ctx, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return Container(
                    child: Text("No data"),
                  );
                } else {
                  return Text(snapshot.data);
                  // return ListView.builder(
                  //   itemCount: snapshot.data.length,
                  //   itemBuilder: (ctx, index) => ListTile(
                  //     title: Text(snapshot.data[index].title),
                  //     subtitle: Text(snapshot.data[index].body),
                  //     contentPadding: EdgeInsets.only(bottom: 20.0),
                  //   ),
                  // );
                }
              }),
        ]));
  }

  List<Widget> Buttons() {
    return <Widget>[
      FutureBuilder(
          future: getNameRequest(),
          builder: (BuildContext ctx, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Text(""),
              );
            } else {
              return Text("Welcome " + snapshot.data + "!",
              style: TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25.0));
            }
          }),
      // Text("Welcome " + DataStorage.name + "!",
      //     style: TextStyle(
      //         fontFamily: 'Montserrat',
      //         color: Colors.black,
      //         fontWeight: FontWeight.bold,
      //         fontSize: 25.0)),
      const Padding(padding: EdgeInsets.only(top: 45.0)),
      Flexible(
        child: Row(
          children: <Widget>[
            _buildButtonCard('Allergies', Colors.lightBlue),
            _buildButtonCard('Personalized Practioner', Colors.red),
          ],
        ),
      ),
      Flexible(
        child: Row(
          children: <Widget>[
            _buildButtonCard('Immunizations', Colors.orange),
          ],
        ),
      ),
      Flexible(
        child: Row(
          children: <Widget>[
            _buildButtonCard('Medication Record', Colors.green),
            _buildButtonCard('Care Plan', Colors.pink)
            // Image.memory(base64Decode('base64String'))
          ],
        ),
      ),
      Flexible(
        child: Row(
          children: <Widget>[
            _buildButtonCard('Find Hospital Near Me', Colors.purple),
          ],
        ),
      ),
    ];
  }

  onClick() {
    print("Clicked Button");
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

Expanded _buildButtonCard(String title, MaterialColor color) {
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
                    print("Test");
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
