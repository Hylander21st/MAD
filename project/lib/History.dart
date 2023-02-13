import 'package:flutter/material.dart';
import 'global.dart';

class HistoryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HistoryPageState();
}

class HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
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
                itemCount: paymentHistory.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(paymentHistory[index].date),
                    subtitle: Text(paymentHistory[index].amount),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      // Show an AlertDialog with the payment details
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Payment Details'),
                            content: Text(
                                'User: ${paymentHistory[index].user}\nDate: ${paymentHistory[index].date}\nAmount: ${paymentHistory[index].amount}\nRefrenceNumber: ${paymentHistory[index].referenceNumber}'),
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
