import 'package:abangi_v1/pages/dash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:abangi_v1/pages/signup.dart';
import '../main.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Error'));
                } else if (snapshot.hasData) {
                  return const DashBoard();
                } else {
                  return const login();
                }
              })),
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
          fontFamily: 'Poppins'),
    );
  }
}

// ignore: camel_case_types
class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _LoginState();
}

class _LoginState extends State<login> {
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late ScaffoldState scaffoldState;

  // ignore: prefer_final_fields
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // ignore: unused_element

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(top: 70),
                    child: const Text(
                      'ABANGI',
                      style: TextStyle(
                          color: Color.fromRGBO(0, 176, 236, 1),
                          fontWeight: FontWeight.w600,
                          fontSize: 35),
                    )),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: mailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                    validator: (email) => email!.isEmpty
                        ? 'Please enter your email'
                        : email.contains('@')
                            ? null
                            : 'Please enter a valid email',
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                    validator: (password) => password!.isEmpty
                        ? 'Please enter your password'
                        : password.length < 6
                            ? 'Password must be at least 6 characters'
                            : null,
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      //forgot password screen
                    },
                    child: const Text(
                      'Forgot Password',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                Container(
                    height: 50,
                    margin: const EdgeInsets.only(top: 15),
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        onSurface: const Color.fromRGBO(0, 176, 236, 1),
                      ),
                      // ignore: sort_child_properties_last
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: logIn,
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(top: 90),
                      child: Row(
                        children: [
                          const Text("Don't have an account?"),
                          TextButton(
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromRGBO(0, 176, 236, 1)),
                            ),
                            onPressed: () {
                              //signup screen
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUp()),
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

  Future logIn() async {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: mailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e.code);
      }
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
