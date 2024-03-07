import 'package:flutter/material.dart';
import 'package:snkrs_demo/colors/colors.dart';
import 'package:snkrs_demo/pages/home.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.punainen,
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 160,
            ),
            Container(
              height: 240,
              padding: EdgeInsets.all(60),
              decoration: BoxDecoration(
                  color: MyColor.violetti, shape: BoxShape.circle),
              child: Image.asset("assets/images/Nike-Logo.png",
                  fit: BoxFit.contain),
            ),
            SizedBox(height: 20),
            Text(
              "Kiitos tilauksesta!",
              style: TextStyle(fontSize: 28, color: Colors.white),
            ),
            Text(
              "Tilaus maksettu onnistuneesti.",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.black),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NavigationPage(),
                    ),
                  );
                },
                child: Text("Sulje"))
          ],
        ),
      ),
    );
  }
}
