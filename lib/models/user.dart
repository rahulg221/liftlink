class User {
  final String uid;
  final String email;
  final String username;
  final String fullname;
  final int age;
  final String bio;
  final String profilePic;
  final String gymLocation;
  final int friendCount;
  final int level;
  final String workoutSplit;
  final String workoutStyle;
  final int xp;

  const User({
    required this.uid,
    required this.email,
    required this.username,
    required this.fullname,
    required this.age,
    required this.bio,
    required this.profilePic,
    required this.gymLocation,
    required this.friendCount,
    required this.level,
    required this.workoutSplit,
    required this.workoutStyle,
    required this.xp,
  });

  // Converts a Map object from a JSON response to a User instance
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uid: json['id'],
      email: json['email'],
      username: json['username'],
      fullname: json['fullname'],
      age: json['age'],
      bio: json['bio'],
      profilePic: json['profile_pic_url'],
      gymLocation: json['gym_location'],
      friendCount: json['friend_count'],
      level: json['level'],
      workoutSplit: json['workout_split'],
      workoutStyle: json['workout_style'],
      xp: json['xp'],
    );
  }
}
