class User {
  final String email;
  final String uid;
  final String profilePic;
  final String username;
  final int followerCount;
  final int followingCount;
  final int streak;
  final String bio;

  const User({
    required this.email,
    required this.uid,
    required this.profilePic,
    required this.username,
    required this.followerCount,
    required this.followingCount,
    required this.streak,
    required this.bio,
  });

  // Converts from JSON
  factory User.fromJson(Map<String, dynamic> data) {
    return User(
      username: data['username'],
      uid: data['id'],
      email: data['email'],
      profilePic: data['profile_pic'],
      followerCount: data['followercount'],
      followingCount: data['followingcount'],
      streak: data['streak'],
      bio: data['bio'],
    );
  }
}
