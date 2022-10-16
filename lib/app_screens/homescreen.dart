import 'package:flutter/material.dart';
import 'package:medftw/app_config/palette.dart';
import 'package:medftw/app_config/styles.dart';
// import 'package:medftw/app_screens/screens.dart';
// import 'package:medftw/app_screens/upcomingEvents.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Future navigateToStudyMaterials(context) async {
  //   Navigator.push(
  //       context, MaterialPageRoute(builder: (context) => StudyMaterials()));
  // }

// code that was inside the padding at the top
// child: Row(
  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //   // children: <Widget>[
  //   //   Container(
  //   //       width: 125.0,
  //   //       child: Row(
  //   //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //   //         // children: <Widget>[
  //   //         //   IconButton(
  //   //         //     icon: Icon(Icons.info),
  //   //         //     color: Color.fromRGBO(33, 191, 189, 1),
  //   //         //     onPressed: () {},
  //   //         //   )
  //   //         // ],
  //   //       )
  //   //   )
  //   // ],
  // ),

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
                borderRadius:
                    BorderRadius.only(topLeft: Radius.circular(100.0)),
              ),
              child: Column(children: Buttons()))
        ]));
  }

  List<Widget> Buttons() {
    return <Widget>[
      const Text('Offering Resources for:',
          style: TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25.0)),
      const Padding(padding: EdgeInsets.only(top: 45.0)),
      Flexible(
        child: Row(
          children: <Widget>[
            _buildButtonCard('Test1', Colors.lightBlue),
            _buildButtonCard('Test2', Colors.red),
          ],
          // children: [
          //   TextButton(
          //       onPressed: () {
          //         print("Test");
          //       },
          //       child: Text("Test"),
          //       style: ButtonStyle(
          //           foregroundColor:
          //               MaterialStateProperty.all<Color>(Colors.blue),
          //           shape: MaterialStateProperty.all<
          //                   RoundedRectangleBorder>(
          //               RoundedRectangleBorder(
          //                   borderRadius: BorderRadius.circular(50.0),
          //                   side: BorderSide(color: Colors.red))),
          //           backgroundColor:
          //               MaterialStateProperty.all<Color>(Colors.red)))
          // ],
        ),
      ),
      Flexible(
        child: Row(
          children: <Widget>[
            _buildButtonCard('Test3', Colors.orange),
          ],
        ),
      ),
      Flexible(
        child: Row(
          children: <Widget>[
            _buildButtonCard('Test4', Colors.green),
            _buildButtonCard('Test5', Colors.pink),
          ],
        ),
      ),
      Flexible(
        child: Row(
          children: <Widget>[
            _buildButtonCard('Test6', Colors.purple),
          ],
        ),
      ),
    ];
  }

  Row Header() {
    return Row(
      children: <Widget>[
        Text('Med',
            style: TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 27.0)),
        SizedBox(width: 5.0),
        Text('For The Win',
            style: TextStyle(
                fontFamily: 'Montserrat', color: Colors.white, fontSize: 27.0))
      ],
    );
  }

  onClick() {
    print("Clicked Button");
  }
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
