import 'dart:async';

import 'package:abangi_v1/pages/dash.dart';
import 'package:abangi_v1/pages/home.dart';
import 'package:abangi_v1/pages/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

late String finalEmail;

class _SplashScreenState extends State<SplashScreen> {
  @override
  void iniState() {
    getValidation().whenComplete(() async {
      Timer(const Duration(seconds: 2),
          () => Get.to(finalEmail == null ? login() : home()));
    });
    super.initState();
  }

  Future getValidation() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainEmail = sharedPreferences.getString('email');
    setState(() {
      finalEmail = obtainEmail!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const CircleAvatar(
              radius: 50.0,
              child: Icon(Icons.local_activity),
            )
          ],
        ),
      ),
    );
  }
}
