class User {
  String username;
  String password;
  String email;

  User({this.username, this.password, this.email});
}

class Carddata {
  String cardno;
  String expiry;
  String cvv;

  Carddata({this.cardno, this.expiry, this.cvv});
}

class Payment {
  String user;
  String date;
  String amount;
  String referenceNumber;

  Payment({this.user, this.date, this.amount, this.referenceNumber});
}

class Location {
  String pointa;
  String pointb;
  String date;

  Location({this.pointa, this.pointb, this.date});
}

List<Location> LocationList = [trip1];

Location trip1 =
    new Location(pointa: "SengKang", pointb: "Yio Chu Kang", date: "13/2/2023");

Carddata card1 = new Carddata(cardno: "123", expiry: "4/56", cvv: "789");
Carddata card2 = new Carddata(cardno: "234", expiry: "4/56", cvv: "123");

List<Carddata> cardList = [card1, card2];

int currentUserIndex = 0;
int currentCardIndex = 0;
int currentJourneyIndex = 0;

User user1 =
    new User(username: "alden", password: "aldenpass", email: "alden@test.com");

List<User> userList = [user1];

int currentPaymentIndex = 0;

List<Payment> paymentHistory = [
  new Payment(
      user: user1.username,
      date: DateTime.now().toString(),
      amount: 20.0.toString(),
      referenceNumber: "ABC123"),
  new Payment(
      user: user1.username,
      date: DateTime.now().subtract(Duration(days: 7)).toString(),
      amount: 10.0.toString(),
      referenceNumber: "DEF456"),
];
