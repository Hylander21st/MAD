import 'dart:io';
import 'Home.dart';
import 'Register.dart';
import 'package:flutter/material.dart';
import 'drawer.dart';
import 'global.dart';

class Login extends StatefulWidget {
  final User data;

  Login({
    @required this.data,
  });

  @override
  State<StatefulWidget> createState() => LoginState();
}

class LoginState extends State<Login> {
  TextEditingController idTEC = TextEditingController();
  TextEditingController pwdTEC = TextEditingController();
  String title = 'Login';
  int index = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff173540),
      appBar: AppBar(
        title: Text('Login Page'),
        backgroundColor: Color(0xff217373),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  child: Text(
                'Welcome, Login below!',
                style: TextStyle(fontSize: 30, color: Colors.white),
              )),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Container(
                    child: Column(children: <Widget>[
                  TextField(
                    style: TextStyle(color: Colors.white),
                    controller: idTEC,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal)),
                        hintText: "ID",
                        hintStyle: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    controller: pwdTEC,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal)),
                        hintText: "PWD",
                        hintStyle: TextStyle(color: Colors.white)),
                    obscureText: true,
                  ),
                ])),
              ),
              SizedBox(height: 20),
              Container(
                  child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account? Sign up',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  TextButton(
                    child: Text('here'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Register()),
                      );
                    },
                  )
                ],
              )),
              RaisedButton(
                color: Colors.blueAccent,
                child: Text('Login'),
                textColor: Colors.white,
                onPressed: () {
                  userList.forEach((user) {
                    if (idTEC.text == widget.data.username &&
                        pwdTEC.text == widget.data.password) {
                      currentUserIndex = userList.indexOf(user);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                    } else {
                      // Show error message
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text('Incorrect ID or password'),
                      ));
                    }
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
