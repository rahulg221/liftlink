class Session {
  final int sessionId;
  final String username;
  final String userId1; // Creator of the session
  final String? userId2;
  final String? userId3;
  final String? userId4;
  final String profilePicUrl;
  final String workoutType;
  final String workoutDateTime;
  final String workoutLocation;
  final bool friendsCanJoin;
  final bool myGymCanJoin;
  final DateTime createdAt;
  final DateTime updatedAt;

  Session({
    required this.sessionId,
    required this.username,
    required this.userId1,
    this.userId2,
    this.userId3,
    this.userId4,
    required this.profilePicUrl,
    required this.workoutType,
    required this.workoutDateTime,
    required this.workoutLocation,
    required this.friendsCanJoin,
    required this.myGymCanJoin,
    required this.createdAt,
    required this.updatedAt,
  });

  // Converts a Map object from a JSON response to a Session instance
  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
      sessionId: json['session_id'],
      username: json['username'],
      userId1: json['user_id1'],
      userId2: json['user_id2'],
      userId3: json['user_id3'],
      userId4: json['user_id4'],
      profilePicUrl: json['profile_pic_url'],
      workoutType: json['workout_type'],
      workoutDateTime: json['workout_date_time'],
      workoutLocation: json['workout_location'],
      friendsCanJoin:
          json['friends_can_join'] == 'true', // or convert 1/0 if stored as int
      myGymCanJoin: json['my_gym_can_join'] == 'true', // same as above
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
