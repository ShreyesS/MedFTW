import 'package:flutter/material.dart';
import 'package:medftw/app_config/palette.dart';
import 'package:medftw/app_config/styles.dart';
import 'package:geolocator/geolocator.dart';
import 'package:medftw/DataStorage.dart';
import 'package:http/http.dart' as http;
import 'package:maps_launcher/maps_launcher.dart';

import 'dart:convert';

// import 'dart:convert'

// import 'package:medftw/app_screens/screens.dart';
// import 'package:medftw/app_screens/upcomingEvents.dart';

class NearestPractitioner extends StatefulWidget {
  @override
  _NearestPractitioner createState() {
    return _NearestPractitioner();
  }
}

class _NearestPractitioner extends State<NearestPractitioner> {
  String base64 = '';

  Future<String> getNameRequest() async {
    String url = "https://medftwserver.herokuapp.com/getnamefromid/" +
        DataStorage.id.toString();
    Uri uri = Uri.parse(url);
    final response = await http.get(uri);
    //print(response.body);
    Map<String, dynamic> map = json.decode(response.body);
    return map["name"];
  }

  Future<String> getAddressRequest() async {
    String url = "https://medftwserver.herokuapp.com/getlocationbyname/" +
        DataStorage.name;
    Uri uri = Uri.parse(url);
    final response = await http.get(uri);
    print(response.body);

    Map<String, dynamic> map = json.decode(response.body);
    return map["locationline"];
  }

  Future<String> setAddressRequest() async {
    print("Set address request was called");
    String url = "https://medftwserver.herokuapp.com/getlocationbyid/" +
        DataStorage.id.toString();

    //print("Name stored in data: " + DataStorage.name);

    Uri uri = Uri.parse(url);
    final response = await http.get(uri);
    print("SetAddress response body: " + response.body);

    Map<String, dynamic> map = json.decode(response.body);
    DataStorage.address = map["locationline"];
    print("Set address request: " + map["locationline"]);
    print("static var: " + DataStorage.address);

    return map["locationline"];
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

  Future<List<dynamic>> getCarePlan() async {
    print("Getting care plan");
    String url = "https://medftwserver.herokuapp.com/getcareplan/" +
        DataStorage.id.toString();
    Uri uri = Uri.parse(url);
    final response = await http.get(uri);

    var carePlans = json.decode(response.body);
    print("Runtime type of json: " + carePlans.runtimeType.toString());

    print("Length: " + DataStorage.carePlans.toString());

    return carePlans;
  }

  Future<List<dynamic>> getNearestPracts() async {
    print("Getting nearest pract");
    String url = "https://medftwserver.herokuapp.com/personalizedpract/" +
        DataStorage.id.toString();
    Uri uri = Uri.parse(url);
    final response = await http.get(uri);

    var nearestPracts = json.decode(response.body);
    print("Runtime type of json: " + nearestPracts.runtimeType.toString());

    // print("Length: " + DataStorage.carePlans.toString());
    DataStorage.practitioners = nearestPracts;
    return nearestPracts;
  }

  Padding nearestPractGenerator(List<dynamic> carePlans) {
    print("GEnerating care plans and length is: " +
        DataStorage.practitioners.length.toString());
    return Padding(
      padding: EdgeInsets.only(top: 0, bottom: 0, left: 25, right: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.height * 0.5,
              height: 700,
              child: ListView.builder(
                  itemCount: DataStorage.practitioners.length,
                  itemBuilder: ((context, index) {
                    return nearestPractDetails(
                        DataStorage.practitioners[index]);
                  })))
        ],
      ),
    );
  }

  Padding nearestPractDetails(List<dynamic> details) {
    print("Plan detail");
    return Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Container(
          alignment: Alignment.center,
          // margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.deepOrange,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Text(details[0],
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0)),
        ));
  }

  @override
  Widget build(BuildContext context) {
    // print("Get Request: " + getRequest());
    //setAddressRequest();
    //getCarePlan();
    return Scaffold(
        backgroundColor: Colors.orange,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Padding(padding: EdgeInsets.only(top: 70)),
            Padding(
              padding: EdgeInsets.only(left: 50, right: 20, top: 70),
              child: Text(DataStorage.name + ", here are practioners near you.",
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0)),
            ),
            SizedBox(
              height: 700,
              width: MediaQuery.of(context).size.width,
              child: FutureBuilder(
                future: getNearestPracts(),
                builder: (BuildContext ctx, AsyncSnapshot snapshot) {
                  // if (snapshot.data != null && snapshot.data?.length != 0) {
                  //   print(snapshot.data?[0]);
                  // }
                  //print("LEN: " + snapshot.data.length.toString());
                  if (snapshot.hasData) {
                    if (DataStorage.carePlans == null) {
                      return Text("No data");
                    } else {
                      print("TYPE: " +
                          DataStorage.practitioners.runtimeType.toString());
                      return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            nearestPractGenerator(DataStorage.practitioners)
                          ]);
                    }
                  }
                  return Container();
                },
              ),
            ),
          ],
        ));
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
              DataStorage.name = snapshot.data;
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
            _buildButtonCard('Allergies', Colors.lightBlue, () {}),
            _buildButtonCard('Personalized Practioner', Colors.red, () {}),
          ],
        ),
      ),
      Flexible(
        child: Row(
          children: <Widget>[
            _buildButtonCard('Immunizations', Colors.orange, () {}),
          ],
        ),
      ),
      Flexible(
        child: Row(
          children: <Widget>[
            _buildButtonCard('Medication Record', Colors.green, () {}),
            _buildButtonCard('Care Plan', Colors.pink, () {})
            // Image.memory(base64Decode('base64String'))
          ],
        ),
      ),
      Flexible(
        child: Row(
          children: <Widget>[
            _buildButtonCard('Find Hospital Near Me', Colors.purple, () {
              MapsLauncher.launchQuery('Hospital near ' + DataStorage.address);
            }),
          ],
        ),
      ),
    ];
  }

  onClick() {
    print("Clicked Button");
  }

  onClickHospital() {}
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
                    onClick();
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
