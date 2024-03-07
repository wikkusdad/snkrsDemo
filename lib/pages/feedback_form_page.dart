import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:snkrs_demo/colors/colors.dart';

class FeedbackFormPage extends StatefulWidget {
  @override
  _FeedbackFormPageState createState() => _FeedbackFormPageState();
}

class _FeedbackFormPageState extends State<FeedbackFormPage> {
  final TextEditingController _messageController = TextEditingController();
  final TextEditingController _userController = TextEditingController();
  bool _recommended = false;

  void _submitFeedback() async {
    await FirebaseFirestore.instance.collection('feedback').add({
      'message': _messageController.text,
      'user': _userController.text,
      'recommended': _recommended,
    });

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.punainen,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Lähetä palaute'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    controller: _messageController,
                    decoration: InputDecoration(labelText: 'Syötä palaute'),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: _userController,
                    decoration: InputDecoration(labelText: 'Nimimerkki'),
                  ),
                  SizedBox(height: 16),
                  CheckboxListTile(
                    title: Text('Suosittelen yritystä'),
                    value: _recommended,
                    onChanged: (value) {
                      setState(() {
                        _recommended = value!;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.black),
              onPressed: _submitFeedback,
              child: Text('Lähetä'),
            ),
          ],
        ),
      ),
    );
  }
}
