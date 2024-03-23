class Post {
  final String caption;
  final String uid;
  final String postId;
  final String username;
  final DateTime createdAt;
  final String postPic;
  final String profilePic;

  const Post({
    required this.caption,
    required this.uid,
    required this.postId,
    required this.username,
    required this.createdAt,
    required this.postPic,
    required this.profilePic,
  });

  // Converts from JSON
  factory Post.fromJson(Map<String, dynamic> data) {
    return Post(
      caption: data['caption'],
      uid: data['uid'],
      postId: data['id'],
      username: data['username'],
      createdAt: data['created_at'],
      postPic: data['post_pic'],
      profilePic: data['profile_pic'],
    );
  }
}
