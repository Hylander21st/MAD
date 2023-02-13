import 'package:flutter/material.dart';
import 'drawer.dart';
import 'global.dart';

class PaymentPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PaymentPageState();
}

class PaymentPageState extends State<PaymentPage> {
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();

  String title = 'Payment';
  int index = 0;
  bool addNewCard = false;
  String cardno = '';
  String expiry = '';
  String cvv = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
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
            addNewCard
                ? Column(
                    children: [
                      TextField(
                        controller: cardNumberController,
                        decoration: InputDecoration(
                          labelText: 'Card Number',
                        ),
                      ),
                      TextField(
                        controller: expiryDateController,
                        decoration: InputDecoration(
                          labelText: 'Expiry Date',
                        ),
                      ),
                      TextField(
                        controller: cvvController,
                        decoration: InputDecoration(
                          labelText: 'CVV',
                        ),
                      ),
                      SizedBox(height: 16),
                      RaisedButton(
                        child: Text('Save'),
                        onPressed: () {
                          setState(() {
                            cardno = cardNumberController.text;
                            expiry = expiryDateController.text;
                            cvv = cvvController.text;
                            Carddata newCard = Carddata(
                              cardno: cardNumberController.text,
                              expiry: expiryDateController.text,
                              cvv: cvvController.text,
                            );
                            cardList.add(newCard);
                            // Clear the controllers after saving the data
                            cardNumberController.clear();
                            expiryDateController.clear();
                            cvvController.clear();

                            addNewCard = false;
                          });

                          // Show an AlertDialog to indicate that the card details were saved
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Success'),
                                content: Text('Card details saved'),
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
                      ),
                    ],
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: cardList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child: Column(
                          children: [
                            ListTile(
                              title:
                                  Text('Credit Card ' + (index + 1).toString()),
                              leading: Icon(Icons.credit_card),
                              onTap: () {
                                // Show an AlertDialog with the card details
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    print(cardList[index]);
                                    return AlertDialog(
                                      title: Text('Card Details'),
                                      content: Text(
                                          'Card Number: ${cardList[index].cardno}\nExpiry: ${cardList[index].expiry}\nCVV: ${cardList[index].cvv}'),
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
                            ),
                          ],
                        ),
                      );
                    }),
            addNewCard == false
                ? ListTile(
                    title: Text('Add New Card'),
                    leading: Icon(Icons.add),
                    onTap: () {
                      print(cardList.length);
                      print('hehlelo');
                      addNewCard = true;
                    },
                  )
                : SizedBox()
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
