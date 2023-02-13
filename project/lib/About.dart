import 'dart:io';
import 'package:flutter_email_sender/flutter_email_sender.dart';

import 'Home.dart';
import 'Register.dart';
import 'Login.dart';
import 'package:flutter/material.dart';
import 'drawer.dart';
import 'package:url_launcher/url_Launcher.dart';

class About extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AboutState();

  final _key = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController subject = TextEditingController();
  TextEditingController body = TextEditingController();
  sendemail(String subject, String body, String recipientemail) async {
    final Email email = Email(
      body: body,
      subject: subject,
      recipients: [recipientemail],
      isHTML: false,
    );
    await FlutterEmailSender.send(email);
  }
}

class AboutState extends State<About> {
  String title = 'About';
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff173540),
      appBar: AppBar(
        title: Text('About Us'),
        backgroundColor: Color(0xff217373),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
      ),
      body: Center(
        // padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 10),
            Text(
              'Our Comany?',
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                'Our Comany specialises in developing mobile applications and we are currently leading the industry',
                style: TextStyle(fontSize: 10, color: Colors.white),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'What is How2Go?',
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                'How2Go is an app which can help you travel singapore more efficiently',
                style: TextStyle(fontSize: 10, color: Colors.white),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    'Contact Us',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: IconButton(
                        onPressed: () => launch('tel: +9385026'),
                        icon: Icon(
                          Icons.phone,
                        ),
                        iconSize: 30.0,
                      ),
                    ),
                    Container(
                      child: IconButton(
                        onPressed: () {
                          launch(
                              'mailto:rajatrrpalankar@gmail.com?subject=This is Subject Title&body=This is Body of Email');
                        },
                        icon: Icon(
                          Icons.email,
                        ),
                        iconSize: 30.0,
                      ),
                    ),
                  ],
                ),
              ],
            )
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
