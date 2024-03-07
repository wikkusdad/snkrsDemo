import 'package:flutter/material.dart';
import 'package:snkrs_demo/colors/colors.dart';
import 'package:snkrs_demo/pages/functions.dart';
import 'package:snkrs_demo/pages/lists.dart';
import 'package:snkrs_demo/pages/success_screen.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.punainen,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Kortti maksu'),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          height: 410,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: MyColor.tausta_harmaa),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.person_2, color: Colors.white),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          labelText: "Kortin haltijan nimi",
                          labelStyle: TextStyle(color: Colors.white),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white))),
                    ),
                  ),
                ],
              ),
              Divider(),
              Row(
                children: [
                  Icon(Icons.credit_card, color: Colors.white),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Kortin numero",
                          labelStyle: TextStyle(color: Colors.white),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white))),
                    ),
                  ),
                ],
              ),
              Divider(),
              Row(
                children: [
                  Icon(
                    Icons.security,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "CVV",
                          labelStyle: TextStyle(color: Colors.white),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white))),
                    ),
                  ),
                ],
              ),
              Divider(),
              Row(
                children: [
                  Icon(
                    Icons.calendar_month,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          labelText: "Vanhenemis päivä",
                          labelStyle: TextStyle(color: Colors.white),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white))),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SuccessScreen(),
                      ),
                    );
                    emptyBasket(basket);
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.black),
                  child: Text("Vahvista tilaus"))
            ],
          ),
        ),
      ),
    );
  }
}
