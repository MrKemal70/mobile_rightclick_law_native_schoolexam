import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_rightclick_law_native/main.dart';
import 'package:sqflite/sqflite.dart';
import 'dashboard.dart';
import 'get_data.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  int userValue;

  bool pressed = false;
  var responseMessage = Text(
    'Hosgeldiniz',
    textAlign: TextAlign.center,
  );

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 175.0,
        child: Image.asset('assets/logojpg.jpg'),
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      controller: _emailController,
      decoration: InputDecoration(
          hintText: 'Email',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final password = TextFormField(
      autofocus: false,
      obscureText: true,
      controller: _passwordController,
      decoration: InputDecoration(
          hintText: 'Password',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    void _performLogin() async {
      String email = _emailController.text;
      String password = _passwordController.text;
      var comingAnswer = await makeLoginRequest(email, password);

      if (comingAnswer.answer) {
        userValue = comingAnswer.userId;
        Navigator.of(context).pushReplacementNamed(Dashboard.tag);
      } else {
        setState(() {
          pressed = true;
          responseMessage = pressed
              ? Text(
                  comingAnswer.responseMessage,
                  textAlign: TextAlign.center,
                )
              : Text('teas');
        });
      }

      print(comingAnswer.responseMessage);
    }

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
          borderRadius: BorderRadius.circular(20),
          shadowColor: Colors.lightBlueAccent.shade100,
          elevation: 10.0,
          child: MaterialButton(
            minWidth: 200.0,
            height: 50.0,
            onPressed: () {
              _performLogin();
            },
            color: Colors.lightBlueAccent,
            child: Text('Login', style: TextStyle(color: Colors.white)),
          )),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            responseMessage,
            SizedBox(height: 15.0),
            email,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 24.0),
            loginButton,
          ],
        ),
      ),
    );
  }
}
