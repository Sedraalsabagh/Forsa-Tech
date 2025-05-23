import 'package:dio/dio.dart';
import '../../presentaion/screen/token_manger.dart';
import '../models/auth.dart';


class AuthWebServices {
  final Dio dio;

  AuthWebServices()
      : dio = Dio(BaseOptions(
          baseUrl: 'http://localhost:8000/',
          receiveDataWhenStatusError: true,
          connectTimeout: Duration(seconds: 60),
          receiveTimeout: Duration(seconds: 60),
        ));

  Future<Map<String, dynamic>> signUp(AuthModel authModel) async {
    try {
      Response response = await dio.post("auth/SignUp/",
          data: authModel.toJson(),
          options: Options(
            headers: {
              "Content-Type": "application/json",
              "Accept": "application/json",
            },
          ));

      return response.data;
    } catch (e) {
      print(" $e");
      throw Exception("error");
    }
  }

  Future<LoginResponse> login(LoginRequest request) async {
    try {
      Response response = await dio.post(
        'auth/LogIn/',
        data: request.toJson(),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

      print("Response Data: ${response.data}");
      print("Status Code: ${response.statusCode}");

      if (response.statusCode == 200) {
        TokenManager.saveToken(response.data['access']);
        return LoginResponse.fromJson(response.data);
      } else {
        throw Exception('Failed to login: ${response.statusCode}');
      }
    } on DioError catch (dioError) {
      print("DioError: ${dioError.message}");
      if (dioError.response != null) {
        print("Response Error Data: ${dioError.response?.data}");
      }
      throw Exception('Failed to login: ${dioError.message}');
    } catch (e) {
      print("Unexpected Error: $e");
      throw Exception('Unexpected error occurred');
    }
  }
}
















// class AuthWebServices {
//   final Dio dio;

//   AuthWebServices()
//       : dio = Dio(BaseOptions(
//           baseUrl: 'http://localhost:8000/',
//           receiveDataWhenStatusError: true,
//           connectTimeout: Duration(seconds: 60),
//           receiveTimeout: Duration(seconds: 60),
//         ));

//   Future<Map<String, dynamic>> signUp(AuthModel authModel) async {
//     try {
//       Response response = await dio.post("auth/SignUp/",
//           data: authModel.toJson(),
//           options: Options(
//             headers: {
//               "Content-Type": "application/json",
//               "Accept": "application/json",
//             },
//           ));

//       return response.data;
//     } catch (e) {
//       print(" $e");
//       throw Exception("error");
//     }
//   }



//   Future<LoginResponse> login(LoginRequest request) async {
//     try {
//       Response response = await dio.post(
//         'auth/LogIn/',
//         data: request.toJson(),
//         options: Options(
//           headers: {
//             'Content-Type': 'application/json',
//             'Accept': 'application/json',
//           },
//         ),
//       );

//       print("Response Data: ${response.data}");
//       print("Status Code: ${response.statusCode}");

//       if (response.statusCode == 200) {
//         TokenManager.saveToken(response.data['access']);
//         return LoginResponse.fromJson(response.data);
//       } else {
//         throw Exception('Failed to login: ${response.statusCode}');
//       }
//     } on DioError catch (dioError) {
//       print("DioError: ${dioError.message}");
//       if (dioError.response != null) {
//         print("Response Error Data: ${dioError.response?.data}");
//       }
//       throw Exception('Failed to login: ${dioError.message}');
//     } catch (e) {
//       print("Unexpected Error: $e");
//       throw Exception('Unexpected error occurred');
//     }
//   }
// }
