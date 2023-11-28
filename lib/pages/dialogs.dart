import 'package:snkrs_demo/colors/colors.dart';
import 'package:snkrs_demo/main.dart';
import 'package:snkrs_demo/pages/checkout_page.dart';
import 'package:flutter/material.dart';
import 'package:snkrs_demo/pages/home.dart';
//import 'package:adding_items/pages/payment.dart';

showSuccessDialog(BuildContext context) {
  Widget basketButton = TextButton(
    style: TextButton.styleFrom(
      primary: Colors.white,
      backgroundColor: Colors.black,
    ),
    child: Text("Go to basket"),
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
    child: Text("Continue shopping"),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NavigationPage()),
      );
    },
  );

  AlertDialog alert = AlertDialog(
    title: Text("Product added successful"),
    content: Text("Would you like to continue shopping?"),
    backgroundColor: MyColor.turkoosi,
    actions: [
      basketButton,
      continueButton,
    ],
  );

  // show the dialog
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
        Navigator.pop(context, "Lasku"); // Palauta valittu maksutapa
      },
      icon: Icon(Icons.insert_drive_file),
      label: Text("Bill"),
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
        Navigator.pop(context, "Card"); // Palauta valittu maksutapa
      },
      icon: Icon(Icons.credit_card),
      label: Text("Debit or Credit Card"),
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
        Navigator.pop(context, "Transfer"); // Palauta valittu maksutapa
      },
      icon: Icon(Icons.monetization_on_outlined),
      label: Text("Bank Transfer"),
      style: TextButton.styleFrom(
        primary: Colors.white,
        backgroundColor: Colors.black,
      ),
    ),
  );

  AlertDialog alert = AlertDialog(
    title: Text("Choose Payment Method"),
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

  // Palauta valittu maksutapa
  //if (selectedOption != null) {
  //selectedPaymentMethod = selectedOption;
  // return selectedOption;
  //}
}
