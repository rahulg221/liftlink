class Post {
  final String caption;
  final String userId;
  final int postId;
  final String username;
  final String createdAt;
  final String postPicUrl;
  final String profilePicUrl;
  final String workoutLocation;
  final int likeCount;
  final int commentCount;
  final bool friendsCanSee;
  final bool myGymCanSee;

  const Post({
    required this.caption,
    required this.userId,
    required this.postId,
    required this.username,
    required this.createdAt,
    required this.postPicUrl,
    required this.profilePicUrl,
    required this.workoutLocation,
    required this.likeCount,
    required this.commentCount,
    required this.friendsCanSee,
    required this.myGymCanSee,
  });

  // Converts a Map object from a JSON response to a Post instance
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      caption: json['caption'],
      userId: json['user_id'],
      postId: json['post_id'],
      username: json['username'],
      createdAt: json['created_at'],
      postPicUrl: json['post_pic_url'],
      profilePicUrl: json['profile_pic_url'],
      workoutLocation: json['workout_location'],
      likeCount: json['like_count'] ?? 0,
      commentCount: json['comment_count'] ?? 0,
      friendsCanSee: json['friends_can_see'] ?? false,
      myGymCanSee: json['my_gym_can_see'] ?? false,
    );
  }
}
