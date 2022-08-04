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
        body: createListing(),
      ),
      theme: Styles.primaryTheme,
    );
  }
}

class createListing extends StatefulWidget {
  const createListing({Key? key}) : super(key: key);

  @override
  State<createListing> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<createListing> {
  TextEditingController nameOfListing = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(top: 10),
                child: const Text('Create Listing', style: Styles.title)),
            Container(
              padding: const EdgeInsets.only(left: 10),
              child: const Text(
                'Complete the information below to create listing.',
                style: Styles.caption,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                child: Text('Add Photo'),
                onPressed: () {},
              ),
            ),

            Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                'Listing Title',
                style: Styles.formHeader,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: nameOfListing,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name this listing',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                'Category',
                style: Styles.formHeader,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: nameOfListing,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Home Equipment',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                'Sub Category',
                style: Styles.formHeader,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: nameOfListing,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'None',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                'Description',
                style: Styles.formHeader,
              ),
            ),

            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(),
            )

            // ignore: avoid_unnecessary_containers
          ],
        ));
  }
}
