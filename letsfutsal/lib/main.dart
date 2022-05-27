import 'package:flutter/material.dart';
import 'package:letsfutsal/Screens/AuthScreens/ForgotPassword.dart';

import 'Screens/AuthScreens/Signin.dart';
import 'Screens/AuthScreens/Signup.dart';
import 'Screens/MyHomePage.dart';
import 'Screens/Tournament/Tournament.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Signin(),
    );
  }
}
