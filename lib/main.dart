import 'package:firebase_core/firebase_core.dart';
import 'package:snkrs_demo/authenticate/auth.dart';
import 'package:snkrs_demo/firebase_options.dart';
import 'package:snkrs_demo/home/wrapper.dart';
import 'package:snkrs_demo/models/user.dart';
//import 'package:snkrs_demo/pages/in_stock.dart';
//import 'package:snkrs_demo/splash_screen.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
//import 'package:snkrs_demo/pages/checkout_page.dart';
//import 'package:snkrs_demo/pages/list_builder.dart';
//import 'package:snkrs_demo/pages/lists.dart';
//import 'package:snkrs_demo/footer.dart';
//import 'package:snkrs_demo/menu_button.dart';
//import 'package:snkrs_demo/pages/upcoming.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<FbUser?>.value(
      initialData: null,
      value: AuthService().user,
      child: MaterialApp(
        //title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Wrapper(),
      ),
    );
  }
}
