class Comment {
  final String content;
  final String
      userId; // This corresponds to 'user_id' in SQL table, assuming UUID is handled as a string
  final int postId; // Matches 'post_id' in SQL table
  final String username; // Username of the commenter
  final String createdAt; // Timestamp of when the comment was created
  final String profilePic; // Profile picture URL of the commenter

  const Comment({
    required this.content,
    required this.userId,
    required this.postId,
    required this.username,
    required this.createdAt,
    required this.profilePic,
  });

  // Converts a Map object from a JSON response to a Comment instance
  factory Comment.fromJson(Map<String, dynamic> data) {
    return Comment(
      content: data['content'],
      userId: data['user_id'],
      postId: data['post_id'],
      username: data['username'],
      createdAt: data['created_at'],
      profilePic: data['profile_pic'],
    );
  }
}
