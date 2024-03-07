import 'package:flutter/material.dart';
import 'package:snkrs_demo/colors/colors.dart';
import 'package:snkrs_demo/pages/home.dart';

class TutorialPage extends StatefulWidget {
  const TutorialPage({Key? key}) : super(key: key);

  @override
  _TutorialPageState createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
  int currentPage = 0;

  final List<Map<String, String>> tutorialpages = [
    {
      'title': '',
      'content':
          'Sovelluksen yläreunasta löydät toimntoja kuten valikko, uloskirjautumine, profiili ja ostoskori.',
      'image': 'assets/images/esittely.png',
    },
    {
      'title': '',
      'content':
          'Etusivulta pääset selaamaan kenkiä skrollaamlla alaspäin ja kategorian kohdalta sivulle.',
      'image': 'assets/images/esittely2.png',
    },
    {
      'title': '',
      'content':
          'Sinulle tallennetaan profiilitietoja ja voit valita itsellesi sopivan profiilikuvan.',
      'image': 'assets/images/esittely3.PNG',
    },
    {
      'title': '',
      'content': 'Meiltä löytyy varmasti sopiva maksutapa juuri sinulle!',
      'image': 'assets/images/esittely4.PNG',
    },
    {
      'title': '',
      'content': 'Tervetuloa käyttämään sovellusta!',
      'image': 'assets/images/esittely5.PNG',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.punainen,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            tutorialpages[currentPage]['title']!,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: MyColor.tausta_harmaa,
                width: 4.0,
              ),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Image.asset(
              tutorialpages[currentPage]['image']!,
              height: 550,
            ),
          ),
          SizedBox(height: 20),
          SizedBox(height: 10),
          Text(
            tutorialpages[currentPage]['content']!,
            style: TextStyle(fontSize: 18, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(tutorialpages.length, (index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index == currentPage
                        ? Colors.black
                        : Colors.black.withOpacity(0.5),
                  ),
                ),
              );
            }),
          ),
          if (currentPage < tutorialpages.length - 1)
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.black),
              onPressed: () {
                setState(() {
                  currentPage++;
                });
              },
              child: Text("Seuraava"),
            ),
          if (currentPage == tutorialpages.length - 1)
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.black),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
              child: Text("Aloita!"),
            ),
        ],
      ),
    );
  }
}
