class ApiEndpoints {
  static const String baseUrl =
      'http://16.16.28.163:3000/api/v1';
//
  static const String loginEndpoint = '/users/login';
  static const String registerEndpoint = '/users/signup';
  static const String forgetPasswordEndpoint = '/users/forgot-password';
  static const String checkOtpEndpoint = '/users/check-otp';
  static const String resetPasswordEndpoint = '/users/reset-password';
  static const String allWorkoutsEndpoint = '/workout';
  static const String workoutExercisesEndpoint = '/workout/workout-exercises/'; /*then workout id */
  static const String exerciseEndpoint = '/exercise/';/*then exercise id */

}