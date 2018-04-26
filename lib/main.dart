import 'package:flutter/material.dart';

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

class SignupForm extends StatefulWidget {
  SignupForm({Key key, this.title}) : super(key: key);

  final String title;

  @override
  SignupPageState createState() => new SignupPageState();
}

class SignupPageState extends State<SignupForm> {

  final formKey = GlobalKey<FormState>();

  void validateAndLogin() {

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Form(
          key: formKey,
          child: new Column(
            children: <Widget>[
              new Padding(
                padding: new EdgeInsets.all(8.0),
                child: new TextFormField(
                  decoration: new InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter your email address',
                      border: const OutlineInputBorder()
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.all(8.0),
                child: new TextFormField(
                  decoration: new InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      border: const OutlineInputBorder()
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.all(8.0),
                child: new TextFormField(
                  decoration: new InputDecoration(
                      labelText: 'Repeat Password',
                      hintText: 'Repeat the password',
                      border: const OutlineInputBorder()
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
