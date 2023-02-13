import 'package:flutter/material.dart';
import 'drawer.dart';
import 'global.dart';

class Edit extends StatefulWidget {
  final String defaultUsername;
  final String defaultEmail;
  final String defaultPassword;

  Edit({this.defaultUsername, this.defaultEmail, this.defaultPassword});

  @override
  State<StatefulWidget> createState() =>
      EditState(defaultUsername, defaultEmail, defaultPassword);
}

class EditState extends State<Edit> {
  EditState(this.name, this.email, this.password);

  final _formKey = GlobalKey<FormState>();
  String name;
  String email;
  String password;
  String title = 'Edit';
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Edit Profile'),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Column(
                children: [],
              ),
              TextFormField(
                initialValue: name,
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onSaved: (value) => name = value,
              ),
              TextFormField(
                initialValue: email,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                onSaved: (value) => email = value,
              ),
              TextFormField(
                initialValue: password,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                onSaved: (value) => password = value,
              ),
              RaisedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    // Update profile
                    setState(() {
                      userList[currentUserIndex].username = name;
                      userList[currentUserIndex].email = email;
                      userList[currentUserIndex].password = password;
                    });
                  }
                },
                child: Text('Update'),
              ),
            ],
          ),
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
