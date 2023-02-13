import 'package:flutter/material.dart';
import 'package:project/About.dart';
import 'package:project/Home.dart';
import 'package:project/Landing.dart';
import 'package:project/Login.dart';
import 'package:project/Register.dart';
import 'package:project/payment.dart';
import 'package:project/global.dart';
import 'Profile.dart';

class MyDrawer extends StatelessWidget {
  final Function onTap;

  MyDrawer({this.onTap});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Color(0xff217373)),
              child: Padding(
                padding: EdgeInsets.all(6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      width: 60,
                      height: 60,
                      child: CircleAvatar(
                          // backgroundImage: AssetImage('images/superhero.jpg'),
                          ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      userList[currentUserIndex].username,
                      // widget.data.username,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      userList[currentUserIndex].email,
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),

            ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Home()));
                }),

            ListTile(
                leading: Icon(Icons.add_to_home_screen_sharp),
                title: Text('About'),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => About()));
                }),
            ListTile(
                leading: Icon(Icons.account_box_sharp),
                title: Text('Profile'),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Profile()));
                }),

            // ListTile(
            //     leading: Icon(Icons.account_box_sharp),
            //     title: Text('Payment'),
            //     onTap: () {
            //       Navigator.of(context).push(
            //           MaterialPageRoute(builder: (context) => PaymentPage()));
            //     }),
          ],
        ),
      ),
    );
  }
}
