import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 50, 51, 52),
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Center(
            child: Text(
              'Seuraa meitä somessa!',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.facebook),
                color: Colors.white,
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.snapchat),
                color: Colors.white,
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
