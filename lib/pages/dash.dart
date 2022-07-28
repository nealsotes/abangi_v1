// ignore_for_file: prefer_const_constructors

import 'package:abangi_v1/pages/account.dart';
import 'package:abangi_v1/pages/activity.dart';
import 'package:abangi_v1/pages/create_listing.dart';
import 'package:abangi_v1/pages/home.dart';
import 'package:abangi_v1/pages/login.dart';
import 'package:abangi_v1/pages/messages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // ignore: prefer_const_constructors
      home: Scaffold(
        body: DashBoardWidget(),
      ),

      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
          fontFamily: 'Poppins'),
    );
  }
}

class DashBoardWidget extends StatefulWidget {
  const DashBoardWidget({Key? key}) : super(key: key);

  @override
  State<DashBoardWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<DashBoardWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomeWidget(),
    activity(),
    createListing(),
    messages(),
    account()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
              primaryColor: Colors.blue,
              textTheme: Theme.of(context)
                  .textTheme
                  // ignore: unnecessary_new
                  .copyWith(caption: new TextStyle(color: Colors.yellow))),
          // ignore: unnecessary_new
          child: new BottomNavigationBar(
            // ignore: prefer_const_literals_to_create_immutables
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.blue,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business, color: Colors.blue),
                label: 'Activity',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.star, color: Colors.blue),
                label: 'Post for Rent',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.message, color: Colors.blue),
                label: 'Messages',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.manage_accounts, color: Colors.blue),
                label: 'Account',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.blue,
            onTap: _onItemTapped,
          )),
    );
  }
}
