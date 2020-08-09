// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:youth_development_app/classes/api_response.dart';
// import 'package:youth_development_app/classes/user.dart';

// class UserService {
  
//   //Url Endpoint
//   static const API = 'http://192.168.100.4/youthapp_api/index.php/api';
//   static const headers = {"Accept": 'application/json'};

//   //Get a single user
//   Future<ApiResponse<User>> user() {
//     return http.post(API + '/users/login', headers: headers).then((data) {
//       if (data.statusCode == 200) {
//         final jsonData = json.decode(data.body);

//           final _oneUser = User(
//               userId: int.parse(jsonData['userId']),
//               name: jsonData['name'],
//               email: jsonData['email'],
//               password: jsonData['password'],
//               userType: int.parse(jsonData['user_type']),
//               createdBy: int.parse(jsonData['created_by']));
//         return ApiResponse<User>(data: _oneUser);
//       } else {
//         return ApiResponse<User>(
//             error: true, errorMessage: 'An error occured');
//       }
//     });
//   }

//   //Get all users
//   Future<ApiResponse<List<User>>> users() {
//     return http.get(API + '/users', headers: headers).then((data) {
//       if (data.statusCode == 200) {
//         final jsonData = json.decode(data.body);

//         final _users = List<User>();

//         for (var user in jsonData) {
//           final _oneUser = User(
//               userId: int.parse(user['userId']),
//               name: user['name'],
//               email: user['email'],
//               password: user['password'],
//               userType: int.parse(user['user_type']),
//               createdBy: int.parse(user['created_by']));
//           //User List
//           _users.add(_oneUser);
//         }
//         return ApiResponse<List<User>>(data: _users);
//       } else {
//         return ApiResponse<List<User>>(
//             error: true, errorMessage: 'An error occured');
//       }
//     });
//   }
// }
