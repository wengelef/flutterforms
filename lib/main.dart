import 'package:flutter/material.dart';
import 'package:helloforms/SignupForm.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Form Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new SignupForm(title: 'Flutter Form Demo'),
    );
  }
}