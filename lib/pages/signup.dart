import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:abangi_v1/pages/login.dart';

import '../main.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: SignUpWidget(),
      ),
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
          fontFamily: 'Poppins'),
    );
  }
}

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({Key? key}) : super(key: key);

  @override
  State<SignUpWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<SignUpWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Column(
                  children: [
                    Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(top: 5),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                              color: Color.fromRGBO(0, 176, 236, 1),
                              fontWeight: FontWeight.w400,
                              fontSize: 20),
                        )),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: const Text(
                        'Create and account to get started today',
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(4),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: TextFormField(
                    // ignore: prefer_const_constructors
                    style: TextStyle(fontSize: 14.0),
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                    validator: (email) =>
                        email != null && !EmailValidator.validate(email)
                            ? 'Enter valid email'
                            : null,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                    // ignore: prefer_const_constructors
                    style: TextStyle(fontSize: 14.0),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    controller: passwordController,
                    validator: (value) => value != null && value.length < 6
                        ? 'Password must be at least 6 characters'
                        : null,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                Container(
                    height: 50,
                    margin: const EdgeInsets.only(top: 15),
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          onSurface: const Color.fromRGBO(0, 176, 236, 1)),
                      // ignore: sort_child_properties_last
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 20),
                        ),
                      ),
                      onPressed: signUp,
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(top: 90),
                      child: Row(
                        children: [
                          const Text("Already have an account?"),
                          TextButton(
                            child: const Text(
                              'Log in',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromRGBO(0, 176, 236, 1)),
                            ),
                            onPressed: () {
                              //login screen
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Login()),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )));
  }

  Future signUp() async {
    final isValid = _formKey.currentState!.validate();
    if (isValid) return;

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      print(e.code);
      if (e.code == 'weak-password') {
        print('Weak Password');
      } else if (e.code == 'email-already-in-use') {
        print('Email already in use');
      } else if (e.code == 'invalid-email') {
        print('Invalid Email');
      } else if (e.code == 'network-request-failed') {
        print('Network Error');
      } else {
        print('Unknown Error');
      }
    }
    // ignore: use_build_context_synchronously
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
