import 'dart:typed_data';
import 'package:fitness_app/models/post.dart';
import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_app/firebase/storage_methods.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Upload post to Firebase
  Future<String> uploadPost(String caption, Uint8List image, String uid,
      String username, String profilePic) async {
    String res = 'There was an error uploading your post.';

    try {
      // Get photo Url and upload image to Firebase storage
      String photoUrl =
          await StorageMethods().uploadImageToStorage(image, 'posts', true);

      String postId = const Uuid().v1();

      Post post = Post(
        caption: caption,
        uid: uid,
        username: username,
        postId: postId,
        datePublished: DateTime.now(),
        photoUrl: photoUrl,
        profilePic: profilePic,
        likes: [],
      );

      _firestore.collection('posts').doc(postId).set(
            post.toJson(),
          );

      res = 'success';
    } catch (err) {
      res = err.toString();
    }

    return res;
  }

  Future<void> likePost(String postId, String uid, List likes) async {
    try {
      if (likes.contains(uid)) {
        await _firestore.collection('posts').doc(postId).update({
          'likes': FieldValue.arrayRemove([uid])
        });
      } else {
        await _firestore.collection('posts').doc(postId).update({
          'likes': FieldValue.arrayUnion([uid])
        });
      }
    } catch (err) {
      print(
        err.toString(),
      );
    }
  }
}
