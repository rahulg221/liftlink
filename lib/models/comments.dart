class Comment {
  final String comment;
  final String uid;
  final int postId;
  final String username;
  final String createdAt;
  final String profilePic;

  const Comment({
    required this.comment,
    required this.uid,
    required this.postId,
    required this.username,
    required this.createdAt,
    required this.profilePic,
  });

  // Converts from JSON
  factory Comment.fromJson(Map<String, dynamic> data) {
    return Comment(
      comment: data['comment'],
      uid: data['uid'],
      postId: data['post_id'],
      username: data['username'],
      createdAt: data['created_at'],
      profilePic: data['profile_pic'],
    );
  }
}
