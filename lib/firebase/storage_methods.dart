import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageMethods {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> uploadImageToStorage(
    Uint8List image,
    String storageFolder,
    bool isPost,
  ) async {
    Reference ref =
        _storage.ref().child(storageFolder).child(_auth.currentUser!.uid);

    UploadTask uploadTask = ref.putData(image);

    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();

    return downloadUrl;
  }
}
