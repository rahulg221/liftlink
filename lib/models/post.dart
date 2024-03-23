class Post {
  final String caption;
  final String userId;
  final String postId;
  final String username;
  final DateTime createdAt;
  final String postPic;
  final String profilePic;

  const Post({
    required this.caption,
    required this.userId,
    required this.postId,
    required this.username,
    required this.createdAt,
    required this.postPic,
    required this.profilePic,
  });

  // Converts to JSON
  Map<String, dynamic> toJson() => {
        "caption": caption,
        "uid": userId,
        "postId": postId,
        "username": username,
        "createdAt": createdAt,
        "postImage": postPic,
        "profilePic": profilePic,
      };

  // Converts from JSON
  factory Post.fromJson(Map<String, dynamic> data) {
    return Post(
      caption: data['caption'],
      userId: data['userId'],
      postId: data['postId'],
      username: data['username'],
      createdAt: data['createdAt'],
      postPic: data['postPic'],
      profilePic: data['profilePic'],
    );
  }
}
