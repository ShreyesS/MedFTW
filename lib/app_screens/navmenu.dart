import 'package:flutter/material.dart';
import 'package:medftw/app_screens/ContactUs.dart';
import 'package:medftw/app_screens/UpcomingInternships.dart';
import 'package:medftw/app_screens/screens.dart';
import 'dart:async';

import 'package:medftw/app_screens/upcomingEvents.dart';

class BottomNavScreen extends StatefulWidget {
  String patientName = "";
  BottomNavScreen(patientName) {
    this.patientName = patientName;
  }

  @override
  _BottomNavScreenState createState() {
    return _BottomNavScreenState();
  }
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  List _screens = List.empty();
  int _currentIndex = 0;

  String _patientName = "";
  // @override
  // void setState(VoidCallback fn) {
  //   print("Set state");
  //   _patientName = widget.patientName;
  // }

  @override
  Widget build(BuildContext context) {
    _screens = [
      HomeScreen(widget.patientName),
      ContactUs(widget.patientName),
    ];
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        elevation: 0.0,
        items: [Icons.home, Icons.wechat_rounded]
            .asMap()
            .map((key, value) => MapEntry(
                  key,
                  BottomNavigationBarItem(
                    label: '',
                    icon: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 6.0,
                        horizontal: 16.0,
                      ),
                      decoration: BoxDecoration(
                        color: _currentIndex == key
                            ? Colors.blue[600]
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Icon(value),
                    ),
                  ),
                ))
            .values
            .toList(),
      ),
    );
  }
}
