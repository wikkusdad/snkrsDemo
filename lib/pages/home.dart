import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:snkrs_demo/authenticate/auth.dart';
import 'package:snkrs_demo/footer.dart';
import 'package:snkrs_demo/menu_button.dart';
import 'package:snkrs_demo/models/user.dart';
import 'package:snkrs_demo/pages/checkout_page.dart';
import 'package:snkrs_demo/pages/in_stock.dart';
import 'package:snkrs_demo/pages/list_builder.dart';
import 'package:snkrs_demo/pages/lists.dart';
import 'package:snkrs_demo/pages/upcoming.dart';
import 'package:snkrs_demo/splash_screen.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

final AuthService _auth = AuthService();
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('hei'),
      actions: <Widget>[
        ElevatedButton(
            onPressed: () async {
              await _auth.signOut();
            },
            child: Text('kirjaudu ulos'))
      ],
    ),
  );
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
                    if (value == 'In stock') {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InStockPage()));
                    } else if (value == 'Upcoming') {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UpcomingPage()));
                    }
                  }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.logout_sharp),
                    ),
                  ),
                  //Padding(
                  //padding: EdgeInsets.only(right: 10),
                  //child:
                  //IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                  //),
                  //Padding(
                  //padding: EdgeInsets.only(right: 10),
                  //child: IconButton(
                  //  onPressed: () {}, icon: Icon(Icons.filter_list)),
                  //),
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
