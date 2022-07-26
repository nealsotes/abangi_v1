// ignore_for_file: prefer_const_constructors

import 'package:abangi_v1/pages/account.dart';
import 'package:abangi_v1/pages/activity.dart';
import 'package:abangi_v1/pages/create_listing.dart';
import 'package:abangi_v1/pages/home.dart';
import 'package:abangi_v1/pages/login.dart';
import 'package:abangi_v1/pages/messages.dart';
import 'package:abangi_v1/pages/welcome.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(const Home());

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      // ignore: prefer_const_constructors
      home: MyStatefulWidget(),
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
          fontFamily: 'Poppins'),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    home(),
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
