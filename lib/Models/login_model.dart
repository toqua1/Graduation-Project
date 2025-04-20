class LoginModel {
  final String id;
  final String name;
  final String email;
  // final String password;
  // final double? age;
  // final double? height;
  // final double? weight;
  // final String? fitnessGoal;
  // final String? activityLevel;
  // final String? gender;
  final int? points; // type?
  final String? profilePic;
  final List? achievements; //type ?
  final List? workingChallenges; // add or what ? not exist in response
  final List? workoutHistory;
  final String token;

  LoginModel({
    // required this.password,
    // required this.age,
    // required this.height,
    // required this.weight,
    // required this.fitnessGoal,
    // required this.activityLevel,
    // required this.gender,
    required this.id,
    required this.name,
    required this.email,
    required this.token,
    this.workingChallenges,
    this.profilePic,
    this.points,
    this.achievements,
    this.workoutHistory,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      id: json['user']['_id'],
      name: json['user']['name'],
      email: json['user']['email'],
      token: json['token'],
      // password: json['user']['password'],
      // age: json['user']['age'],
      profilePic: json['user']['profilePic'] ,
      // height: json['user']['height'],
      // weight: json['user']['weight'],
      // fitnessGoal: json['user']['fitnessGoal'],
      // activityLevel: json['user']['activityLevel'],
      // gender: json['user']['gender'],
      points: json['user']['points'] ?? 0,
      achievements: json['user']['achievements'] ?? [],
      workoutHistory: json['user']['workoutHistory'] ?? [],
        workingChallenges:json['user']['workingChallenges'] ?? []
    );
  }
}
