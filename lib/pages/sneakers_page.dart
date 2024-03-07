import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter/src/foundation/key.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snkrs_demo/colors/colors.dart';
// import 'package:adding_items/main.dart';
import 'package:snkrs_demo/pages/dialogs.dart';

import 'functions.dart';

// ignore: must_be_immutable
class SneakerPage extends StatefulWidget {
  SneakerPage(
      {required this.index,
      required this.brand,
      required this.description,
      required this.model,
      required this.price,
      required this.imageURL,
      required this.sneakerList});
  int index;
  String brand;
  String model;
  String description;
  int price;
  String imageURL;
  List sneakerList;

  @override
  State<SneakerPage> createState() => _SneakerPageState();
}

bool addedToBasket = false;
int selectedIndex = 6;
List sizes = [
  37.0,
  37.5,
  38.0,
  38.5,
  39.0,
  39.5,
  40.0,
  40.5,
  41.0,
  41.5,
  42.0,
  42.5,
  43.0,
  43.5,
  44.0,
  44.5,
  45.0,
  45.5,
  46.0
];

class _SneakerPageState extends State<SneakerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        Padding(
          padding: EdgeInsets.fromLTRB(10, 50, 5, 15),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey[200]),
            width: MediaQuery.of(context).size.width,
            child: Image.asset(widget.imageURL),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Text(
            "${widget.brand} ${widget.model}",
            style:
                GoogleFonts.prompt(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),
        Divider(),
        Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Text(
              widget.description,
              textAlign: TextAlign.start,
              style:
                  GoogleFonts.prompt(fontSize: 16, fontWeight: FontWeight.w400),
            )),
        Divider(),
        SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: sizes.length,
            itemBuilder: (context, int index) => Padding(
              padding: const EdgeInsets.only(left: 5),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: CircleAvatar(
                  backgroundColor:
                      index == selectedIndex ? MyColor.turkoosi : Colors.black,
                  radius: 25,
                  child: Text(sizes[index].toString(),
                      style: TextStyle(
                        color: index == selectedIndex
                            ? Colors.black
                            : Colors.white,
                      )),
                ),
              ),
            ),
          ),
        ),
        Divider(),
        Text(
          "€" + widget.price.toString(),
          style: GoogleFonts.prompt(fontSize: 24, fontWeight: FontWeight.w500),
        ),
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 180,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.black),
              onPressed: () {
                showSuccessDialog(context);

                setState(() {
                  addedToBasket = true;
                  addTobag(
                      brand: widget.brand,
                      model: widget.model,
                      imageUrl: widget.imageURL,
                      size: sizes[selectedIndex],
                      price: widget.price);
                });
              },
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.shopping_bag),
                    Text("Lisää ostoskoriin")
                  ]),
            ),
          ),
        )
      ]),
    );
  }
}
