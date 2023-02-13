import 'package:flutter/material.dart';
import 'package:project/History.dart';
import 'package:project/edit.dart';
import 'global.dart';

class Profile extends StatefulWidget {
  @override
  ProfileState createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  String name = "John Doe";
  String email = "johndoe@email.com";
  String profileImage = "https://via.placeholder.com/150";

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
            SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(profileImage),
            ),
            SizedBox(height: 20),
            Text(
              "Welcome " + userList[currentUserIndex].username,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              "Email: " + userList[currentUserIndex].email,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 20),
            RaisedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Edit()));
              },
              child: Text("Edit Profile"),
            ),
            RaisedButton(
              onPressed: () {
                // Edit profile action
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HistoryPage()));
              },
              child: Text("History"),
            ),
          ],
        ),
      ),
    );
  }
}
