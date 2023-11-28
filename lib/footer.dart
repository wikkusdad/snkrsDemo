import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 255, 156, 214),
      padding: EdgeInsets.all(16.0),
      child: const Center(
        child: Text(
          'Roope Pajarinen development',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
