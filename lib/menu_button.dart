import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final void Function(String) onItemSelected;

  MenuButton({required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: onItemSelected,
      itemBuilder: (BuildContext context) {
        return {'Feed', 'In stock', 'Upcoming'}.map((String choice) {
          return PopupMenuItem<String>(
            value: choice,
            child: Text(choice),
          );
        }).toList();
      },
      child: Icon(
        Icons.menu,
        color: Colors.black,
        size: 40,
      ),
    );
  }
}
