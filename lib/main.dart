import 'package:flutter/material.dart';
import 'package:registrationapp/Sign_Up.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'registration and login',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SignUp(),
    );
  }
}
