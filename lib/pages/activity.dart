// ignore_for_file: camel_case_types

import 'package:abangi_v1/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:abangi_v1/pages/signup.dart';
import 'login.dart';

void main() => runApp(App());

// ignore: use_key_in_widget_constructors
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: activity(),
      ),
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
          fontFamily: 'Poppins'),
    );
  }
}

class activity extends StatefulWidget {
  const activity({Key? key}) : super(key: key);

  @override
  State<activity> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<activity> {
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
                  'Activity',
                  style: Styles.title,
                )),

            // ignore: avoid_unnecessary_containers

            Container(
                padding: const EdgeInsets.all(10),
                // ignore: prefer_const_constructors
                child: Text(
                  'My Inquiries',
                  style: Styles.subtitle,
                )),
          ],
        ));
  }
}
