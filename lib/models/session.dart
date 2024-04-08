class Session {
  final String uid;
  final int sessionId;
  final String username;
  final String createdAt;
  final String profilePic;
  final String workoutType;
  final String workoutDateTime;
  final String friendOne;
  final String friendTwo;
  final int maxCapacity;
  final int curCapacity;

  const Session({
    required this.uid,
    required this.sessionId,
    required this.username,
    required this.createdAt,
    required this.profilePic,
    required this.workoutType,
    required this.workoutDateTime,
    required this.friendOne,
    required this.friendTwo,
    required this.maxCapacity,
    required this.curCapacity,
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
      workoutDateTime: data['workout_datetime'],
      friendOne: data['friend_one'],
      friendTwo: data['friend_two'],
      maxCapacity: data['max_capacity'],
      curCapacity: data['cur_capacity'],
    );
  }
}
