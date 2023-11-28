import 'package:flutter/material.dart';
import 'package:snkrs_demo/pages/checkout_page.dart';

class MyAppBar extends StatelessWidget {
  final List<String> basket;

  MyAppBar({required this.basket});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(""),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        IconButton(onPressed: () {}, icon: Icon(Icons.filter_list)),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CheckoutPage()),
                );
              },
              icon: Icon(Icons.shopping_bag),
            ),
            if (basket.length > 0)
              CircleAvatar(
                backgroundColor: Color.fromARGB(255, 5, 50, 252),
                radius: 7.5,
                child: Text(
                  basket.length.toString(),
                  style: TextStyle(fontSize: 10),
                ),
              )
          ],
        ),
      ],
    );
  }
}
