import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snkrs_demo/pages/hoodies_page.dart';
import 'package:snkrs_demo/pages/sneakers_page.dart';

import 'lists.dart';

class SneakerList extends StatelessWidget {
  const SneakerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: sneakersList.length,
        itemBuilder: ((context, int index) {
          return GestureDetector(
            onTap: (() {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SneakerPage(
                          index: index,
                          sneakerList: sneakersList,
                          description: sneakersList[index][2],
                          model: sneakersList[index][1],
                          brand: sneakersList[index][0],
                          price: sneakersList[index][3],
                          imageURL: sneakersList[index][4],
                        )),
              );
            }),
            child: Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                alignment: Alignment.center,
                textDirection: TextDirection.rtl,
                fit: StackFit.loose,
                clipBehavior: Clip.hardEdge,
                children: [
                  Positioned(
                    top: 45,
                    bottom: 45,
                    right: 25,
                    left: 25,
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: sneakersList[index][5],
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  Stack(
                    children: [
                      Positioned(
                        top: 230,
                        right: 30,
                        child: Text(
                          "Notify me",
                          style: GoogleFonts.prompt(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                      top: 50,
                      bottom: 35,
                      left: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                sneakersList[index][0],
                                style: GoogleFonts.roboto(
                                    color: Colors.white, fontSize: 26),
                              ),
                              Text(
                                sneakersList[index][1],
                                style: GoogleFonts.roboto(
                                    color: Colors.white, fontSize: 26),
                              ),
                            ],
                          ),
                        ],
                      )),
                  Positioned(
                    right: 0,
                    bottom: 65,
                    child: RotationTransition(
                      turns: AlwaysStoppedAnimation(-30 / 360),
                      child: Container(
                          height: 220,
                          child: Image.asset(sneakersList[index][4])),
                    ),
                  ),
                  Positioned(
                      top: 50,
                      bottom: 35,
                      left: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                sneakersList[index][0],
                                style: GoogleFonts.roboto(
                                    color: Colors.white, fontSize: 26),
                              ),
                              Text(
                                sneakersList[index][1],
                                style: GoogleFonts.roboto(
                                    color: Colors.white, fontSize: 26),
                              ),
                            ],
                          ),
                        ],
                      )),
                ],
              ),
            ),
          );
        }));
  }
}

class AirforceList extends StatelessWidget {
  const AirforceList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: AF1List.length,
        itemBuilder: ((context, int index) {
          return GestureDetector(
            onTap: (() {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SneakerPage(
                          index: index,
                          sneakerList: AF1List,
                          description: AF1List[index][2],
                          model: AF1List[index][1],
                          brand: AF1List[index][0],
                          price: AF1List[index][3],
                          imageURL: AF1List[index][4],
                        )),
              );
            }),
            child: Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                alignment: Alignment.center,
                textDirection: TextDirection.rtl,
                fit: StackFit.loose,
                clipBehavior: Clip.hardEdge,
                children: [
                  Positioned(
                    top: 45,
                    bottom: 45,
                    right: 25,
                    left: 25,
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: AF1List[index][5],
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  Positioned(
                      top: 230,
                      bottom: 35,
                      right: 30,
                      child: Text(
                        "Notify me",
                        style: GoogleFonts.prompt(
                            color: Colors.white, fontSize: 16),
                      )),
                  Positioned(
                      top: 50,
                      bottom: 35,
                      left: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AF1List[index][0],
                                style: GoogleFonts.roboto(
                                    color: Colors.white, fontSize: 26),
                              ),
                              Text(
                                AF1List[index][1],
                                style: GoogleFonts.roboto(
                                    color: Colors.white, fontSize: 26),
                              ),
                            ],
                          ),
                        ],
                      )),
                  Positioned(
                    right: 10,
                    bottom: 65,
                    child: RotationTransition(
                      turns: AlwaysStoppedAnimation(-30 / 360),
                      child: Container(
                          height: 220, child: Image.asset(AF1List[index][4])),
                    ),
                  ),
                  Positioned(
                      top: 50,
                      bottom: 35,
                      left: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AF1List[index][0],
                                style: GoogleFonts.roboto(
                                    color: Colors.white, fontSize: 26),
                              ),
                              Text(
                                AF1List[index][1],
                                style: GoogleFonts.roboto(
                                    color: Colors.white, fontSize: 26),
                              ),
                            ],
                          ),
                        ],
                      )),
                ],
              ),
            ),
          );
        }));
  }
}

class DunksList extends StatelessWidget {
  const DunksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dunksList.length,
        itemBuilder: ((context, int index) {
          return GestureDetector(
            onTap: (() {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SneakerPage(
                          index: index,
                          sneakerList: dunksList,
                          description: dunksList[index][2],
                          model: dunksList[index][1],
                          brand: dunksList[index][0],
                          price: dunksList[index][3],
                          imageURL: dunksList[index][4],
                        )),
              );
            }),
            child: Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                alignment: Alignment.center,
                textDirection: TextDirection.rtl,
                fit: StackFit.loose,
                clipBehavior: Clip.hardEdge,
                children: [
                  Positioned(
                    top: 45,
                    bottom: 45,
                    right: 25,
                    left: 25,
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: dunksList[index][5],
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  Positioned(
                      top: 230,
                      bottom: 35,
                      right: 30,
                      child: Text(
                        "Notify me",
                        style: GoogleFonts.prompt(
                            color: Colors.white, fontSize: 16),
                      )),
                  Positioned(
                      top: 50,
                      bottom: 35,
                      left: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                dunksList[index][0],
                                style: GoogleFonts.roboto(
                                    color: Colors.white, fontSize: 26),
                              ),
                              Text(
                                dunksList[index][1],
                                style: GoogleFonts.roboto(
                                    color: Colors.white, fontSize: 26),
                              ),
                            ],
                          ),
                        ],
                      )),
                  Positioned(
                    right: 0,
                    bottom: 50,
                    child: RotationTransition(
                      turns: AlwaysStoppedAnimation(-20 / 360),
                      child: Container(
                          height: 220, child: Image.asset(dunksList[index][4])),
                    ),
                  ),
                  Positioned(
                      top: 50,
                      bottom: 35,
                      left: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                dunksList[index][0],
                                style: GoogleFonts.roboto(
                                    color: Colors.white, fontSize: 26),
                              ),
                              Text(
                                dunksList[index][1],
                                style: GoogleFonts.roboto(
                                    color: Colors.white, fontSize: 26),
                              ),
                            ],
                          ),
                        ],
                      )),
                ],
              ),
            ),
          );
        }));
  }
}

class HoodieList extends StatelessWidget {
  const HoodieList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: hoodies.length,
        itemBuilder: ((context, int index) {
          return GestureDetector(
            onTap: (() {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HoodiesPage(
                          index: index,
                          hoodiesList: hoodies,
                          description: hoodies[index][2],
                          model: hoodies[index][1],
                          brand: hoodies[index][0],
                          price: hoodies[index][3],
                          imageURL: hoodies[index][4],
                        )),
              );
            }),
            child: Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                alignment: Alignment.center,
                textDirection: TextDirection.rtl,
                fit: StackFit.loose,
                clipBehavior: Clip.hardEdge,
                children: [
                  Positioned(
                    top: 45,
                    bottom: 45,
                    right: 25,
                    left: 25,
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: hoodies[index][5],
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  Positioned(
                      top: 230,
                      bottom: 35,
                      right: 30,
                      child: Text(
                        "Notify me",
                        style: GoogleFonts.prompt(
                            color: Colors.white, fontSize: 16),
                      )),
                  Positioned(
                      top: 50,
                      bottom: 35,
                      left: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                hoodies[index][0],
                                style: GoogleFonts.roboto(
                                    color: Colors.white, fontSize: 26),
                              ),
                              Text(
                                hoodies[index][1],
                                style: GoogleFonts.roboto(
                                    color: Colors.white, fontSize: 26),
                              ),
                            ],
                          ),
                        ],
                      )),
                  Positioned(
                    right: 50,
                    bottom: 15,
                    child: RotationTransition(
                      turns: AlwaysStoppedAnimation(0 / 360),
                      child: Container(
                          height: 320, child: Image.asset(hoodies[index][4])),
                    ),
                  ),
                  Positioned(
                      top: 50,
                      bottom: 35,
                      left: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                hoodies[index][0],
                                style: GoogleFonts.roboto(
                                    color: Colors.white, fontSize: 26),
                              ),
                              Text(
                                hoodies[index][1],
                                style: GoogleFonts.roboto(
                                    color: Colors.white, fontSize: 26),
                              ),
                            ],
                          ),
                        ],
                      )),
                ],
              ),
            ),
          );
        }));
  }
}
