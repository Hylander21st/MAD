import 'dart:io';
import 'Login.dart';
import 'About.dart';
import 'Home.dart';
import 'package:flutter/material.dart';
import 'Register.dart';
import 'drawer.dart';

class MyData {
  final String id;
  final String pwd;

  MyData(this.id, this.pwd);
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Landing(),
    );
  }
}

class Landing extends StatefulWidget {
  final MyData data;

  Landing({
    @required this.data,
  });

  @override
  State<StatefulWidget> createState() => LandingState();
}

class LandingState extends State<Landing> {
  TextEditingController toTEC = TextEditingController();
  TextEditingController fromTEC = TextEditingController();
  String title = 'Landing';
  int index = 0;
  List<Widget> list = [Home(), About(), Landing(), Register()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff173540),
      appBar: AppBar(
        title: Text('How2Go'),
        backgroundColor: Color(0xff217373),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Column(children: [
              SizedBox(height: 10),
              Text(
                'Where to?',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ]),
            SizedBox(height: 10),
            SizedBox(
              width: 300,
              child: TextField(
                controller: toTEC,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal)),
                    hintText: "To",
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                    hintStyle: TextStyle(color: Colors.teal)),
              ),
            ),
            SizedBox(
              width: 300,
              child: TextField(
                controller: fromTEC,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal)),
                    hintText: "From",
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                    hintStyle: TextStyle(color: Colors.teal)),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                border: Border.all(width: 5, color: Colors.black),
                shape: BoxShape.rectangle,
                image: DecorationImage(
                    // alignment: Alignment.center,
                    image: AssetImage(
                      'images/map.jpg',
                    ),
                    fit: BoxFit.fill),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: 150,
              child: RaisedButton(
                color: Colors.blueAccent,
                child: Text('Go'),
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
              ),
            ),
            SizedBox(
              width: 150,
              child: RaisedButton(
                color: Colors.blueAccent,
                child: Text('Login'),
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
