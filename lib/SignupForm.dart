import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helloforms/SignupPresenter.dart';
import 'package:helloforms/SignupView.dart';


class SignupForm extends StatefulWidget {
  SignupForm({Key key, this.title}) : super(key: key);

  final String title;

  @override
  SignupPageState createState() => new SignupPageState();
}

class SignupPageState extends State<SignupForm> implements SignupView {

  SignupPresenter presenter = new SignupPresenter();

  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();


  @override
  void initState() {
    super.initState();
    presenter.initState(this);
  }

  @override
  void dispose() {
    super.dispose();
    passwordController.dispose();
  }

  void validateAndLogin() {
    if (formKey.currentState.validate()) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return new AlertDialog(
              content: new Text("Successful registration", style: new TextStyle(fontSize: 26.0),),
              actions: <Widget>[
                new FlatButton(
                    onPressed: () { Navigator.pop(context); },
                    child: new Text("OK")
                )
              ],
            );
          }
      );
    }
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
                  validator: validateEmail,
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
                  controller: passwordController,
                  obscureText: true,
                  validator: validatePassword,
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
                  obscureText: true,
                  validator: validateRepeatPassword,
                ),
              ),
              new Container(
                alignment: Alignment.centerRight,
                padding: new EdgeInsets.all(8.0),
                child: new RaisedButton(
                    child: const Text("Submit"),
                    onPressed: validateAndLogin
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String validateEmail(String val) {
    return new RegExp(r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)').allMatches(val).isEmpty ? "Invalid Email" : null;
  }

  String validatePassword(String val) {
    return new RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$').allMatches(val).isEmpty ? "Invalid Password" : null;
  }

  String validateRepeatPassword(String val) {
    return passwordController.text != val ? "Passwords must match" : null;
  }
}
