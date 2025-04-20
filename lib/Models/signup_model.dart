class SignUpModel {
  final String name;
  final String email;
  final String password;
  final int? age;
  // final String profilePic;
  final double? height;
  final double? weight;
  final String? fitnessGoal;
  final String? activityLevel;
  final String? gender;

  SignUpModel({
    required this.name,
    required this.email,
    required this.password,
    this.age,
    this.height,
    this.weight,
    this.fitnessGoal,
    this.gender,
    this.activityLevel ,
  });
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'gender': gender,
      'age': age,
      'height': height,
      'weight': weight,
      'fitnessGoal': fitnessGoal,
      'activityLevel': activityLevel,
    };
  }
}
