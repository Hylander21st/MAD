import 'dart:io';

import 'package:project/Journey.dart';
import 'package:project/global.dart';
import 'package:project/payment.dart';
import 'Register.dart';
import 'package:flutter/material.dart';
import 'drawer.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class MyData {
  final String id;

  final String pwd;

  MyData(this.id, this.pwd);
}

class HomeState extends State<Home> {
  String _dropdownValue = "Taxi";
  List<String> dropDownOptions = ["Taxi", "Car", "MRT", "Bus", "Walking"];

  void dropdownCallback(String selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _dropdownValue = selectedValue;
      });
    }
  }

  String _selectedModeOfTransportation = 'Car';
  bool isRed = false;
  TextEditingController toTEC = TextEditingController();
  TextEditingController fromTEC = TextEditingController();
  String title = 'Home';
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff173540),
      appBar: AppBar(
        title: Text('Home'),
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
              SizedBox(height: 15),
              Text(
                'Where to?',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ]),
            SizedBox(height: 15),
            SizedBox(
              width: 300,
              child: TextField(
                style: TextStyle(color: Colors.white),
                controller: toTEC,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal)),
                    hintText: "To",
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                    hintStyle: TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(
              width: 300,
              child: TextField(
                style: TextStyle(color: Colors.white),
                controller: fromTEC,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal)),
                    hintText: "From",
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                    hintStyle: TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(height: 15),
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
            Container(
              width: 300,
              height: 50,
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Form(
                child: DropdownButtonFormField(
                  value: _selectedModeOfTransportation,
                  icon: Icon(Icons.arrow_drop_down),
                  items: [
                    DropdownMenuItem(
                      child: Row(
                        children: [
                          Icon(Icons.local_taxi_outlined),
                          SizedBox(width: 10),
                          Text("Taxi"),
                        ],
                      ),
                      value: "Taxi",
                    ),
                    DropdownMenuItem(
                      child: Row(
                        children: [
                          Icon(Icons.directions_car),
                          SizedBox(width: 10),
                          Text("Car"),
                        ],
                      ),
                      value: "Car",
                    ),
                    DropdownMenuItem(
                      child: Row(
                        children: [
                          Icon(Icons.directions_subway),
                          SizedBox(width: 10),
                          Text("MRT"),
                        ],
                      ),
                      value: "MRT",
                    ),
                    DropdownMenuItem(
                      child: Row(
                        children: [
                          Icon(Icons.directions_bus),
                          SizedBox(width: 10),
                          Text("Bus"),
                        ],
                      ),
                      value: "Bus",
                    ),
                    DropdownMenuItem(
                      child: Row(
                        children: [
                          Icon(Icons.directions_walk),
                          SizedBox(width: 10),
                          Text("Walk"),
                        ],
                      ),
                      value: "Walk",
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedModeOfTransportation = value;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 5),
            RaisedButton(
              color: Colors.blueAccent,
              child: Text('Go'),
              textColor: Colors.white,
              onPressed: () {
                if (_selectedModeOfTransportation == "Taxi") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PaymentPage()),
                  );
                } else {
                  Location newJourney = new Location(
                    pointa: fromTEC.text,
                    pointb: toTEC.text,
                    date: DateTime.now().toString(),
                  );
                  LocationList.add(newJourney);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Journey(
                              data: newJourney,
                            )),
                  );
                }
                ;
              },
            ),
          ],
        ),
      ),
      drawer: MyDrawer(
        onTap: (context, i, txt) {
          setState(() {
            index = i;
            title = txt;
            Navigator.pop(context);
          });
        },
      ),
    );
  }
}
