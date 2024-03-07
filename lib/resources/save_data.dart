import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

final FirebaseStorage _storage = FirebaseStorage.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class StoreData {
  Future<String> uploadImageToStorage(String childName, Uint8List file) async {
    String timeStamp = DateTime.now().microsecondsSinceEpoch.toString();
    String uniqueFileName = '$timeStamp _$childName';
    Reference ref = _storage.ref().child(uniqueFileName);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;

    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> saveData({required Uint8List file}) async {
    String resp = 'error';
    try {
      String imageUrl = await uploadImageToStorage('ProfileImage', file);
      String uid = FirebaseAuth.instance.currentUser!.uid;

      DocumentReference userDoc = _firestore.collection('User').doc(uid);

      await userDoc.update({
        'imageLink': imageUrl,
      });

      resp = 'onnistui';
    } catch (err) {
      resp = err.toString();
    }
    return resp;
  }
}
