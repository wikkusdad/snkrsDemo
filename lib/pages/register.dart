import 'package:flutter/material.dart';
import 'package:snkrs_demo/authenticate/auth.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  const Register({super.key, required this.toggleView});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 141, 255, 200),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 0, 0),
        title: Text('Rekisteröidy'),
        actions: <Widget>[
          ElevatedButton.icon(
              onPressed: () {
                widget.toggleView();
              },
              icon: (Icon(Icons.person_4_outlined)),
              label: Text('Kirjaudu'))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 15),
              TextFormField(
                validator: (val) => val!.isEmpty ? 'Syötä sähköposti' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 15),
              TextFormField(
                validator: (val) =>
                    val!.length < 6 ? 'ss tulee olla 6 merkkiä pitkä' : null,
                obscureText: true,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    dynamic result;
                    await _auth.registerWithEmailAndPassword(email, password);
                    if (result == null) {
                      setState(() => error = 'virhe');
                    }
                  }
                },
                child: Text('Rekisteröidy'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
