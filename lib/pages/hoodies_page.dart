import 'package:snkrs_demo/colors/colors.dart';
import 'package:snkrs_demo/pages/dialogs.dart';
import 'package:snkrs_demo/pages/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:adding_items/main.dart';

class HoodiesPage extends StatefulWidget {
  final int index;
  final String brand;
  final String model;
  final String description;
  final int price;
  final String imageURL;
  final List hoodiesList;

  HoodiesPage({
    required this.index,
    required this.brand,
    required this.model,
    required this.description,
    required this.price,
    required this.imageURL,
    required this.hoodiesList,
  });

  @override
  _HoodiesPageState createState() => _HoodiesPageState();
}

class _HoodiesPageState extends State<HoodiesPage> {
  int selectedIndex = 1;
  List<String> hoodiesizes = ["SX", "S", "M", "L", "XL", "XXL"];

  bool addedToBasket = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(10, 50, 5, 15),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey[200],
              ),
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: Image.asset(widget.imageURL),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              "${widget.brand} ${widget.model}",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Text(
              widget.description,
              textAlign: TextAlign.start,
              style: GoogleFonts.prompt(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Divider(),
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: hoodiesizes.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(left: 5),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: CircleAvatar(
                    backgroundColor: index == selectedIndex
                        ? MyColor.turkoosi
                        : Colors.black,
                    radius: 25,
                    child: Text(
                      hoodiesizes[index],
                      style: TextStyle(
                          color: index == selectedIndex
                              ? Colors.black
                              : Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Divider(),
          Text(
            "€" + widget.price.toString(),
            style: GoogleFonts.prompt(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            width: 150,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.black),
              onPressed: () {
                showSuccessDialog(context);
                setState(() {
                  addedToBasket = true;
                  addTobag2(
                      brand: widget.brand,
                      model: widget.model,
                      imageUrl: widget.imageURL,
                      hoodiesize: hoodiesizes[selectedIndex],
                      price: widget.price);
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.shopping_bag),
                  Text("Add to bag"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
