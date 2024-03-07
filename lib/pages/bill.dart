import 'package:flutter/material.dart';
import 'package:snkrs_demo/colors/colors.dart';
import 'package:snkrs_demo/pages/functions.dart';
import 'package:snkrs_demo/pages/payment.dart';
import 'package:snkrs_demo/pages/success_screen.dart';

import 'lists.dart';

class BillPage extends StatelessWidget {
  const BillPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey,
        padding: EdgeInsets.all(26.0),
        child: Center(
          child: Container(
            width: 300,
            height: 260,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(35),
              ),
              color: MyColor.turkoosi,
            ),
            padding: EdgeInsets.all(26.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Lasku',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 34.0),
                Text(
                  'Olet valinnut maksutavaksi laskun. Lasku tulee maksaa 30pv sisällä ostotapahtumasta.',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 20),
                SizedBox(height: 16.0),
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
