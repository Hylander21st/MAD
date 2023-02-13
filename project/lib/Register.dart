import 'dart:io';
import 'package:project/Login.dart';
import 'global.dart';
import 'Home.dart';
import 'package:flutter/material.dart';
import 'drawer.dart';

class Register extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RegisterState();
}

class MyData {
  final String id;

  final String pwd;

  MyData(this.id, this.pwd);
}

class RegisterState extends State<Register> {
  TextEditingController userTEC = TextEditingController();
  TextEditingController emailTEC = TextEditingController();
  TextEditingController pwdTEC = TextEditingController();
  TextEditingController pwd1TEC = TextEditingController();
  String title = 'Register';
  int index = 0;
  String userIdError = '';
  String emailError = '';
  String pwdError = '';
  String pwd1Error = '';
  String errText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff173540),
      appBar: AppBar(
        title: Text('Register '),
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
                'Welcome, Register below!',
                style: TextStyle(fontSize: 30, color: Colors.white),
              )),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Container(
                    child: Column(children: <Widget>[
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: userTEC,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal)),
                        hintText: "ID",
                        hintStyle: TextStyle(color: Colors.white)),
                    validator: (value) {
                      if (value.isEmpty) {
                        setState(() {
                          userIdError = 'ID is required';
                        });
                        return "ID is required";
                      }
                      setState(() {
                        userIdError = '';
                      });
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  Text(userIdError, style: TextStyle(color: Colors.red)),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: emailTEC,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal)),
                        hintText: "Email",
                        hintStyle: TextStyle(color: Colors.white)),
                    validator: (value) {
                      if (value.isEmpty) {
                        setState(() {
                          emailError = 'Email is required';
                        });
                        return "Email is required";
                      }
                      if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                        setState(() {
                          emailError =
                              'Invalid Format. Please Enter a valid email address';
                        });
                        return "Invalid Format. Please Enter a valid email address";
                      }
                      setState(() {
                        emailError = '';
                      });
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  Text(emailError, style: TextStyle(color: Colors.red)),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: pwdTEC,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal)),
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.white)),
                    obscureText: true,
                    validator: (value) {
                      if (value.isEmpty) {
                        setState(() {
                          pwdError = 'Password is required';
                        });
                        return "Password is required";
                      }
                      setState(() {
                        pwdError = '';
                      });
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  Text(pwdError, style: TextStyle(color: Colors.red)),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: pwd1TEC,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal)),
                        hintText: "Confirm Password",
                        hintStyle: TextStyle(color: Colors.white)),
                    obscureText: true,
                    validator: (value) {
                      if (value.isEmpty) {
                        setState(() {
                          pwd1Error = 'Confirm password is required';
                        });
                        return "Confirm password is required";
                      }
                      if (value != pwdTEC.text) {
                        setState(() {
                          pwd1Error = 'Passwords do not match';
                        });
                        return "Passwords do not match";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  Text(pwd1Error, style: TextStyle(color: Colors.red)),
                  SizedBox(
                    height: 20,
                  ),
                ])),
              ),
              SizedBox(height: 20),
              Container(
                  child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [],
              )),
              RaisedButton(
                color: Colors.blueAccent,
                child: Text('Register'),
                textColor: Colors.white,
                onPressed: () {
                  if (pwdTEC.text == pwd1TEC.text &&
                      pwdTEC.text.isNotEmpty &&
                      pwd1TEC.text.isNotEmpty) {
                    User newUser = new User(
                        username: userTEC.text,
                        password: pwdTEC.text,
                        email: emailTEC.text);

                    userList.add(newUser);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Login(
                                data: newUser,
                              )),
                    );
                  } else {
                    print("Passwords do not match");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
