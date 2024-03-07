import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:snkrs_demo/colors/colors.dart';
import 'package:snkrs_demo/pages/feedback_form_page.dart';

class FeedbackListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.punainen,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Asiakaspalautteet'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('feedback').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          var feedbackList = snapshot.data?.docs;

          return ListView.builder(
            itemCount: feedbackList?.length,
            itemBuilder: (context, index) {
              var feedback =
                  feedbackList![index].data() as Map<String, dynamic>;
              var message = feedback['message'] ?? 'Ei viestiä';
              var user = feedback['user'] ?? 'Tuntematon käyttäjä';
              var recommended = feedback['recommended'] ?? false;

              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: Card(
                  color: MyColor.tekstikentta_harmaa,
                  elevation: 2,
                  child: ListTile(
                    title: Text(message),
                    subtitle: Text('Nimimerkki: $user'),
                    trailing: Icon(
                      recommended ? Icons.thumb_up : Icons.thumb_down,
                      color: recommended ? Colors.green : Colors.red,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FeedbackFormPage()),
          );
        },
        label: Text("Lisää palaute"),
        icon: Icon(Icons.add),
        backgroundColor: Colors.black,
      ),
    );
  }
}
