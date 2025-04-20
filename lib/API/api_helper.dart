import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' as prefix;
import 'package:graduation_project/Models/login_model.dart';
import 'package:graduation_project/Models/signup_model.dart';
import 'package:graduation_project/core/Services/alert_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Models/exercise_model.dart';
import '../core/Services/handle_dio_error.dart';
import 'endpoints.dart';

//
class ApiData {
  final _dio = Dio();
  late String authToken;

  ApiData() {
    _loadAuthToken();
  }
//
  Future<void> _loadAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    authToken = prefs.getString('token') ?? '';
  }

  Future<void> saveUserData({
    required String token,
    required String name,
    required String email,
    required String id,
    // required String role
  }) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
    prefs.setString('name', name);
    prefs.setString('email', email);
    prefs.setString('id', id);
    // prefs.setString('role', role);
  }

//   // Load data from SharedPreferences
  Future<Map<String, String?>> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'token': prefs.getString('token'),
      'name': prefs.getString('name'),
      'email': prefs.getString('email'),
      'id': prefs.getString('id'),
      // 'role': prefs.getString('role'),
    };
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    // Get.offAll(() => LoginPage(), transition: Transition.fadeIn);
  }

  Future<List<Exercise>> fetchExercisesForWorkout(String workoutId) async {
    try {
      final response = await _dio.get(
          '${ApiEndpoints.baseUrl}${ApiEndpoints.workoutExercisesEndpoint}$workoutId');

      if (response.statusCode == 200) {
        List<dynamic> exercisesData = response.data['data']['exercises'];
        return exercisesData.map((e) => Exercise.fromJson(e)).toList();
      } else {
        throw Exception("Failed to load exercises");
      }
    } catch (e) {
      throw Exception("Error fetching exercises: $e");
    }
  }

//   Future updateProfile(String name, String address, String phone) async {
//     try {
//       var data = await getUserData();
//       String? id = data['id'];
//       final response = await dio.patch(
//         '${ApiEndpoints.baseUrl}${ApiEndpoints.changeDriverStatusEndpoint}$id',
//         data: {
//           'name': name,
//           'phone': phone,
//           'address': address,
//         },
//         options: Options(
//           headers: {
//             'Authorization': 'Bearer $authToken',
//           },
//         ),
//       );
//       print(id);
//       if (response.statusCode == 200) {
//         final driverData = response.data['data']['driver'];
//         // final token = response.data['token'];
//         print('#####');
//         print(driverData['name']);
//         print(driverData['phone']);
//         print(driverData['address']);
//         await saveUserData(
//           token: '',
//           name: driverData['name'],
//           email: driverData['email'],
//           phone: driverData['phone'],
//           id: driverData['_id'],
//           role: driverData['role'],
//           address: driverData['address'],
//         );
//
//         // final name = response.data['data']['driver']['name'];
//         // final email = response.data['data']['driver']['email'];
//         // final phone = response.data['data']['driver']['phone'];
//         // final id = response.data['data']['driver']['_id'];
//         // saveUserData(token: token, name: name, email: email, phone: phone, id: id);
//       }
//     } catch (e) {
//       print('--->$e');
//       if (e is DioException) {
//       } else if (e is TypeError) {
//       } else {}
//     }
//   }

  // Future<bool> signUpUser(SignUpModel signUpData) async {
  //   try {
  //     final data = {
  //       'name': signUpData.name,
  //       'email': signUpData.email,
  //       'password': signUpData.password,
  //     };
  //
  //     final response = await _dio.post(
  //       '${ApiEndpoints.baseUrl}${ApiEndpoints.registerEndpoint}',
  //       data: data,
  //       options: Options(
  //         headers: {
  //           'Content-Type': 'application/json',
  //         },
  //       ),
  //     );
  //     if (response.statusCode == 201 || response.statusCode == 200) {
  //       final dataMap = response.data['data'];
  //       final token = dataMap['token'];
  //       final userData = dataMap['user'];
  //
  //       await saveUserData(
  //         token: token,
  //         name: userData['name'],
  //         email: userData['email'],
  //         id: userData['_id'],
  //       );
  //       return true ;
  //     } else {
  //       // Handle non-200 status codes
  //       throw Exception('Sign-up failed: ${response.data['message'] ?? 'Unknown error'}');
  //     }
  //   }on DioException catch (e) {
  //     // Handle Dio-specific errors (e.g., network issues, timeouts)
  //     if (e.response != null) {
  //       // Server responded with an error (e.g., 400, 500)
  //       throw Exception('Sign-up failed: ${e.response?.data['message'] ?? e.message}');
  //     } else {
  //       // Network or other Dio-related errors
  //       throw Exception('Sign-up failed: ${e.message}');
  //     }
  //   } catch (e) {
  //     // Handle any other unexpected errors
  //     throw Exception('Sign-up failed: An unexpected error occurred');
  //   }
  // }

  Future<bool> signUpUser(SignUpModel signUpData) async {
    try {
      final data = {
        'name': signUpData.name,
        'email': signUpData.email,
        'password': signUpData.password,
      };

      final response = await _dio.post(
        '${ApiEndpoints.baseUrl}${ApiEndpoints.registerEndpoint}',
        data: data,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        final dataMap = response.data['data'];
        final token = dataMap['token'];
        final userData = dataMap['user'];

        await saveUserData(
          token: token,
          name: userData['name'],
          email: userData['email'],
          id: userData['_id'],
        );
        return true;
      } else {
        throw Exception(response.data['message'] ?? 'Sign-up failed. Please try again.');
      }
    } on DioException catch (e) {
      log(e.toString());
      throw Exception(DioErrorHandler.handleDioError(e));
    } catch (e) {
      throw Exception('An unexpected error occurred. Please try again.');
    }
  }


  Future<bool> loginUser(String email, String password)
  async {
    try {
      final response = await _dio.post(
        '${ApiEndpoints.baseUrl}${ApiEndpoints.loginEndpoint}',
        data: {
          'email': email,
          'password': password,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        final data = response.data['data'];
        final user = LoginModel.fromJson(data);

        await saveUserData(
            token: user.token, name: user.name, email: user.email, id: user.id);

        return true;
      } else {
        throw Exception(response.data['message'] ?? 'Login Failed, Try Again!');
      }
    } catch (e) {
      if (e is DioException) {
        log(e.response?.data['message'] ?? e.message);
        throw Exception(DioErrorHandler.handleDioError(e));
      } else {
        log('$e');
        throw Exception('An unexpected error occurred. Please try again.');
      }
    }
  }
}
