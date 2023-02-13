import 'package:flutter/material.dart';
import 'package:project/Home.dart';
import 'global.dart';

class Journey extends StatefulWidget {
  final Location data;

  Journey({@required this.data}) ;

  @override
  State<StatefulWidget> createState() => JourneyState();
}




class JourneyState extends State<Journey> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trips'),
        backgroundColor: Color(0xff217373),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: LocationList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(LocationList[index].pointa),
                    subtitle: Text(LocationList[index].pointb),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      // Show an AlertDialog with the payment details
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Journey Details'),
                            content: Text(
                                'From: ${LocationList[index].pointa}\nTo: ${LocationList[index].pointb}\nDate: ${LocationList[index].date}'),
                            actions: [
                              FlatButton(
                                child: Text('Ok'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
