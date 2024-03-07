import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:snkrs_demo/colors/colors.dart';

class FAQPage extends StatefulWidget {
  @override
  _FAQPageState createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.punainen,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('FAQ'),
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: _firestore.collection('FAQ').get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final List<QueryDocumentSnapshot> faqList = snapshot.data!.docs;
            return ListView.builder(
              itemCount: faqList.length,
              itemBuilder: (context, index) {
                final faq = faqList[index].data() as Map<String, dynamic>;
                final question = faq['question'] ?? '';
                final answer = faq['answer'] ?? '';

                return Container(
                  child: Card(
                    color: MyColor.tekstikentta_harmaa,
                    margin: EdgeInsets.all(6.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: ExpansionTile(
                      title: Text(
                        question,
                        style: TextStyle(color: Colors.black),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(answer),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
