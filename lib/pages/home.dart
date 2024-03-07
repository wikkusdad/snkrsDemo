import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snkrs_demo/footer.dart';
import 'package:snkrs_demo/menu_button.dart';
import 'package:snkrs_demo/models/toast.dart';
import 'package:snkrs_demo/pages/checkout_page.dart';
import 'package:snkrs_demo/pages/faq.dart';
import 'package:snkrs_demo/pages/feedback_page.dart';
import 'package:snkrs_demo/pages/list_builder.dart';
import 'package:snkrs_demo/pages/lists.dart';
import 'package:snkrs_demo/pages/profile.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NavigationPage(),
    );
  }
}

class NavigationPage extends StatefulWidget {
  NavigationPage();

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 189, 189, 189),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  MenuButton(onItemSelected: (value) {
                    if (value == 'FAQ') {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => FAQPage()));
                    } else if (value == 'Asiakas palautteet') {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FeedbackListPage()));
                    }
                  }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: IconButton(
                        onPressed: () {
                          FirebaseAuth.instance.signOut();
                          Navigator.pushNamed(context, "/login");
                          showToast(message: "Kirjauduttu ulos onnistuneesti.");
                        },
                        icon: Icon(Icons.logout_sharp)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfilePage()),
                            );
                          },
                          icon: Icon(Icons.man),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CheckoutPage()),
                              );
                            },
                            icon: Icon(Icons.shopping_bag)),
                        if (basket.length > 0)
                          CircleAvatar(
                            backgroundColor: Colors.red,
                            radius: 7.5,
                            child: Text(
                              basket.length.toString(),
                              style: TextStyle(fontSize: 10),
                            ),
                          )
                        else
                          Center()
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Jordans",
              style:
                  GoogleFonts.prompt(fontSize: 36, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 300,
            child: SneakerList(),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Air Force 1",
              style:
                  GoogleFonts.prompt(fontSize: 36, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 300,
            child: AirforceList(),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Dunks",
              style:
                  GoogleFonts.prompt(fontSize: 36, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 300,
            child: DunksList(),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Hoodies",
              style:
                  GoogleFonts.prompt(fontSize: 36, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 300,
            child: HoodieList(),
          ),
          Footer(),
        ],
      ),
    );
  }
}
