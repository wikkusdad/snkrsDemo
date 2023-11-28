import 'package:flutter/material.dart';
import 'package:snkrs_demo/authenticate/auth.dart';
//import 'package:snkrs_demo/main.dart';
import 'package:snkrs_demo/pages/home.dart';

class LoginPage extends StatefulWidget {
  final Function toggleView;
  const LoginPage({super.key, required this.toggleView});
  @override
  State<LoginPage> createState() => _LoginPageState();
  //_LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthService _auth = AuthService();

  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 0, 0),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 0, 0),
        title: Text('Kirjaudu'),
        actions: <Widget>[
          ElevatedButton.icon(
              onPressed: () {
                widget.toggleView();
              },
              icon: (Icon(Icons.person_4_outlined)),
              label: Text('Rekisteröidy'))
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/Jumpman_logo.png',
                  height: 220,
                ),
                SizedBox(
                  height: 24,
                ),
                TextField(
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 28),
                TextField(
                  onChanged: (val) {
                    setState(() => password = val);
                  },
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 28),
                ElevatedButton(
                  onPressed: () async {
                    print(email);
                    print(password);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    minimumSize: Size(230, 60),
                    padding: EdgeInsets.all(24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text('Login'),
                ),
                SizedBox(height: 14),
                ElevatedButton(
                  onPressed: () {
                    //{
                    // dynamic result = await _auth.signInAnon();
                    //if (result == null) {
                    //print('virhe kirjautuessa');
                    //} else {
                    //print('kirjauduttu');
                    //print(result.uid);
                    //}
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NavigationPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    minimumSize: Size(230, 60),
                    padding: EdgeInsets.all(24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text('Continue as a guest'),
                ),
                SizedBox(height: 15),

                //ElevatedButton(
                //  onPressed: () {
                //  widget.toggleView();
                //},
                //child: Text('Rekisteröidy'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
