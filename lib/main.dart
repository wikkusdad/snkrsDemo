import 'package:firebase_core/firebase_core.dart';
//import 'package:snkrs_demo/pages/in_stock.dart';
//import 'package:snkrs_demo/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:snkrs_demo/firebase_options.dart';
import 'package:snkrs_demo/pages/home.dart';
import 'package:snkrs_demo/pages/login_page.dart';
import 'package:snkrs_demo/pages/register.dart';
import 'package:snkrs_demo/pages/tutorials/tutorial.dart';
import 'package:snkrs_demo/splash_screen.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter',
      routes: {
        '/': (context) => SplashScreen(
              child: LoginPage(),
            ),
        '/login': (context) => LoginPage(),
        '/signUp': (context) => SignUpPage(),
        '/home': (context) => Home(),
        '/tutorial': (context) => TutorialPage(),
      },
    );
  }
}
