class Post {
  final String caption;
  final String uid;
  final String postId;
  final String username;
  final datePublished;
  final String photoUrl;
  final String profilePic;
  final likes;

  const Post({
    required this.caption,
    required this.uid,
    required this.postId,
    required this.username,
    required this.datePublished,
    required this.photoUrl,
    required this.profilePic,
    required this.likes,
  });

  // Converts to JSON
  Map<String, dynamic> toJson() => {
        "caption": caption,
        "uid": uid,
        "postId": postId,
        "username": username,
        "datePublished": datePublished,
        "photoUrl": photoUrl,
        "profilePic": profilePic,
        "likes": likes,
      };

  // Uses snapshot to convert to a post model
  /*
  factory Post.fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Post(
      caption: snapshot['caption'],
      uid: snapshot['uid'],
      postId: snapshot['postId'],
      username: snapshot['username'],
      datePublished: snapshot['datePublished'],
      photoUrl: snapshot['postUrl'],
      profilePic: snapshot['profilePic'],
      likes: snapshot['likes'],
    );
  }*/
}
