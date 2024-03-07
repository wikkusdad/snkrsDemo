import 'package:flutter/material.dart';
import 'package:snkrs_demo/colors/colors.dart';
//import 'package:snkrs_demo/main.dart';
import 'package:snkrs_demo/pages/checkout_page.dart';
import 'package:snkrs_demo/pages/home.dart';
//import 'package:adding_items/pages/payment.dart';

showTutorialDialog(BuildContext context) {
  Widget tutorialButton = TextButton(onPressed: () {}, child: Text("Seuraava"));
  AlertDialog alert = AlertDialog(
    title: Text("Tervetuloa käyttämään Sneakers app sovellusta!"),
    content: Text(
        "Haluan esitellä sinulle muutamia tärkeitä asioita sovelluksesta."),
    backgroundColor: MyColor.turkoosi,
    actions: [
      tutorialButton,
    ],
  );
}

showSuccessDialog(BuildContext context) {
  Widget basketButton = TextButton(
    style: TextButton.styleFrom(
      primary: Colors.white,
      backgroundColor: Colors.black,
    ),
    child: Text("Mene ostoskoriin"),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CheckoutPage()),
      );
    },
  );
  Widget continueButton = TextButton(
    style: TextButton.styleFrom(
      primary: Colors.white,
      backgroundColor: Colors.black,
    ),
    child: Text("Jatka ostoksia"),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NavigationPage()),
      );
    },
  );

  AlertDialog alert = AlertDialog(
    title: Text("Tuote lisätty ostoskoriin."),
    content: Text("Haluatko jatkaa ostoksia vielä?"),
    backgroundColor: MyColor.turkoosi,
    actions: [
      basketButton,
      continueButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

Future<String?> showPaymentOptionsDialog(BuildContext context) async {
  //String selectedPaymentMethod = '';
  //String? result = await showPaymentOptionsDialog(context);

  Widget invoiceButton = Container(
    width: 190,
    child: TextButton.icon(
      onPressed: () {
        Navigator.pop(context, "Lasku");
      },
      icon: Icon(Icons.insert_drive_file),
      label: Text("Lasku"),
      style: TextButton.styleFrom(
        primary: Colors.white,
        backgroundColor: Colors.black,
      ),
    ),
  );

  Widget cardButton = Container(
    width: 190,
    child: TextButton.icon(
      onPressed: () {
        Navigator.pop(context, "Kortti");
      },
      icon: Icon(Icons.credit_card),
      label: Text("Pankki tai luottokortti"),
      style: TextButton.styleFrom(
        primary: Colors.white,
        backgroundColor: Colors.black,
      ),
    ),
  );

  Widget transferButton = Container(
    width: 190,
    child: TextButton.icon(
      onPressed: () {
        Navigator.pop(context, "Tilisiirto");
      },
      icon: Icon(Icons.monetization_on_outlined),
      label: Text("Tilisiirto"),
      style: TextButton.styleFrom(
        primary: Colors.white,
        backgroundColor: Colors.black,
      ),
    ),
  );

  AlertDialog alert = AlertDialog(
    title: Text("Valitse maksutapa"),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        invoiceButton,
        cardButton,
        transferButton,
      ],
    ),
  );

  var selectedOption = await showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );

  return selectedOption;

  //if (selectedOption != null) {
  //selectedPaymentMethod = selectedOption;
  // return selectedOption;
  //}
}
