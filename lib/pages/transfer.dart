import 'package:flutter/material.dart';
import 'package:snkrs_demo/colors/colors.dart';
import 'package:snkrs_demo/pages/functions.dart';
import 'package:snkrs_demo/pages/lists.dart';
import 'package:snkrs_demo/pages/payment.dart';
import 'package:snkrs_demo/pages/success_screen.dart';

class bankTransfer extends StatefulWidget {
  const bankTransfer({super.key});

  @override
  State<bankTransfer> createState() => _bankTransferState();
}

class _bankTransferState extends State<bankTransfer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Tilisiirto"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Container(
            width: 350,
            height: 360,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(35),
              ),
              color: MyColor.turkoosi,
            ),
            padding: EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Tilisiirto',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 34.0),
                Text(
                  'Olet valinnut maksutavaksi tilisiiron. Suorita maksu alla olevien tietojen mukaan. Kun maksu on rekisteröitynyt järjestelmäämme, lähetemmä tilausvahvistuksen sähköpostiisi.',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 20),
                Column(
                  children: [
                    Text("Tilinumero: FI17 3405 7685 9999 22"),
                    Text("Viitenumero: ${randomReferenceNumber()}"),
                    Text("Saaja: Sneakers Shop Oyj"),
                    Text(
                        "Summa: ${(calculateTotalAmount(basket) + 10).toStringAsFixed(2)} €")
                  ],
                ),
                SizedBox(
                  height: 26,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PaymentPage()));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                        ),
                        child: Text('Edellinen'),
                      ),
                      SizedBox(width: 8.0),
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
                        child: Text('Vahvista tilaus'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
