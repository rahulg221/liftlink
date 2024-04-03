class Session {
  final String uid;
  final int sessionId;
  final String username;
  final String createdAt;
  final String profilePic;
  final String workoutType;
  final String workoutTime;
  final String workoutLevel;
  final String workoutStyle;
  final List<String> members;

  const Session({
    required this.uid,
    required this.sessionId,
    required this.username,
    required this.createdAt,
    required this.profilePic,
    required this.workoutType,
    required this.workoutTime,
    required this.workoutLevel,
    required this.workoutStyle,
    required this.members,
  });

  // Converts from JSON
  factory Session.fromJson(Map<String, dynamic> data) {
    return Session(
      uid: data['uid'],
      sessionId: data['id'],
      username: data['username'],
      createdAt: data['created_at'],
      profilePic: data['profile_pic'],
      workoutType: data['workout_type'],
      workoutTime: data['workout_time'],
      workoutLevel: data['workout_level'],
      workoutStyle: data['workout_style'],
      members: List<String>.from(data['members']),
    );
  }
}
