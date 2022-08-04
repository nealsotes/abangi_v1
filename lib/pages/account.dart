// ignore_for_file: camel_case_types

import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:abangi_v1/styles/styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';
// ignore: unused_import

import 'login.dart';

void main() => runApp(App());

// ignore: use_key_in_widget_constructors
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: account(),
      ),
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
          fontFamily: 'Poppins'),
    );
  }
}

class account extends StatefulWidget {
  const account({Key? key}) : super(key: key);

  @override
  State<account> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<account> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(top: 10),
                child: const Text(
                  'Account',
                  style: Styles.title,
                )),

            // ignore: avoid_unnecessary_containers

            Container(
                // ignore: prefer_const_constructors
                padding: const EdgeInsets.all(10),
                // ignore: prefer_const_constructors
                child: Text(
                  'My Inquiries',
                  style: Styles.subtitle,
                )),
            Container(
                height: 50,
                margin: const EdgeInsets.only(top: 15),
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromRGBO(0, 176, 236, 1),
                  ),
                  // ignore: sort_child_properties_last
                  child: const Text('Logout'),
                  onPressed: () => FirebaseAuth.instance.signOut(),
                )),
          ],
        ));
  }
}
