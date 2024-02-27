import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String uid;
  final String photoUrl;
  final String username;
  final int followerCount;
  final int followingCount;
  final int streak;
  final String bio;

  const User({
    required this.email,
    required this.uid,
    required this.photoUrl,
    required this.username,
    required this.followerCount,
    required this.followingCount,
    required this.streak,
    required this.bio,
  });

  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "email": email,
        "photoUrl": photoUrl,
        "followerCount": followerCount,
        "followingCount": followingCount,
        "streak": streak,
        "bio": bio,
      };

  // Uses snapshot to convert to a user model
  factory User.fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      username: snapshot['username'],
      uid: snapshot['uid'],
      email: snapshot['email'],
      photoUrl: snapshot['photoUrl'],
      followerCount: snapshot['followerCount'],
      followingCount: snapshot['followingCount'],
      streak: snapshot['streak'],
      bio: snapshot['bio'],
    );
  }
}
