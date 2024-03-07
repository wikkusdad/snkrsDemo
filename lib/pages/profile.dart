import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:snkrs_demo/colors/colors.dart';
import 'package:snkrs_demo/models/toast.dart';
import 'package:snkrs_demo/pages/functions.dart';
import 'package:snkrs_demo/resources/save_data.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String username = '';
  String phoneNumber = '';
  String email = '';
  String? _imageLink;

  Uint8List? _image;

  Future _getDataFromDatabase() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    await FirebaseFirestore.instance
        .collection('User')
        .doc(uid)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        setState(() {
          username = snapshot.data()!["username"];
          phoneNumber = snapshot.data()!["phoneNumber"];
          email = snapshot.data()!["email"];
        });

        String imageLink = snapshot.data()!["imageLink"];
        if (imageLink != null && imageLink.isNotEmpty) {
          setState(() {
            _imageLink = imageLink;
          });
        }
      }
    });
  }

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  @override
  void initState() {
    super.initState();
    _getDataFromDatabase();
  }

  void SaveProfile() async {
    if (_image != null) {
      String resp = await StoreData().saveData(file: _image!);
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.punainen,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Profiili'),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 12),
          height: 450,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 50, 51, 52),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _image != null
                  ? CircleAvatar(
                      radius: 70,
                      backgroundImage: MemoryImage(_image!),
                    )
                  : CircleAvatar(
                      backgroundColor: MyColor.punainen,
                      radius: 70,
                      backgroundImage: _imageLink != null &&
                              _imageLink!.isNotEmpty
                          ? NetworkImage(_imageLink!)
                          : NetworkImage(
                              'https://static.thenounproject.com/png/1095867-200.png'),
                    ),
              Positioned(
                child: IconButton(
                  onPressed: () {
                    selectImage();
                  },
                  icon: Icon(Icons.add_a_photo),
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sähköposti: ",
                    style: GoogleFonts.acme(fontSize: 18, color: Colors.white),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    email,
                    style: GoogleFonts.acme(fontSize: 15, color: Colors.white),
                  ),
                ],
              ),
              Divider(height: 8, color: Colors.white),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Käyttäjätunnus: ",
                    style: GoogleFonts.acme(fontSize: 18, color: Colors.white),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    username,
                    style: GoogleFonts.acme(fontSize: 15, color: Colors.white),
                  ),
                ],
              ),
              Divider(height: 8, color: Colors.white),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Puhelinnumero: ",
                    style: GoogleFonts.acme(fontSize: 18, color: Colors.white),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    phoneNumber,
                    style: GoogleFonts.acme(fontSize: 15, color: Colors.white),
                  ),
                ],
              ),
              Divider(height: 8, color: Colors.white),
              Visibility(
                visible: _image != null,
                child: ElevatedButton(
                  onPressed: () {
                    SaveProfile();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    elevation: 3,
                    textStyle: GoogleFonts.acme(
                      fontSize: 16,
                    ),
                  ),
                  child: Text("Tallenna"),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Kirjaudu ulos',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          SizedBox(width: 8),
          FloatingActionButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushNamed(context, "/login");
              showToast(message: "Kirjauduttu ulos onnistuneesti.");
            },
            backgroundColor: Colors.black,
            child: Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
