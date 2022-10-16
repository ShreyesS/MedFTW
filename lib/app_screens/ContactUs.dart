import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:medftw/app_config/palette.dart';
import 'package:medftw/DataStorage.dart';


class ContactUs extends StatelessWidget {

    String patientName = "";
    ContactUs(patientName);
    final Uri feedBack_url = Uri.parse('https://docs.google.com/forms/d/e/1FAIpQLSfEmVAbrq3vHrCpKsF4T4sQ8SjhZLbiT9FRZbVAc2fPASd17A/viewform?usp=sf_link');

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 195, 121, 227),
        body: ListView(
          
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 50.0, bottom: 30),
              child: Text(
                "Contact Us",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Montserrat",
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 10.0, bottom: 0, left: 10, right: 10),
              child: Text(
                "Have any questions or comments? Write us here!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Montserrat",
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Container(
                padding: EdgeInsets.only(top: 30, bottom: 0),
                height: MediaQuery.of(context).size.height * 0.70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(100.0)),
                ),

                child: Column(
        children: <Widget>[

          Padding(
                    padding: EdgeInsets.only(top: 150.0)),

            SizedBox(
              width:220,
              height: 200,
              child:ElevatedButton(
              child: Text("Submit a Feedback Form Here!",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "Montserrat",
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 19,
                ),),
              style: ElevatedButton.styleFrom(
      primary: Color.fromARGB(255, 195, 121, 227),
      onPrimary: Colors.white,
      shape: new RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(30.0))),
              onPressed: _launchUrl, // obtaining the feedback url for clients 
        )
            )
            ])
        )
        ]));
        
  }

  Future<void> _launchUrl() async { //url 
  if (!await launchUrl(feedBack_url)) {
    throw 'Could not launch feedBack_url';
  }

}
}