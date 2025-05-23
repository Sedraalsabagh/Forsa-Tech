import 'package:devloper_app/data/models/auth.dart';
import 'package:devloper_app/data/webService/auth.dart';


class AuthRepository {
  late final AuthWebServices authWebServices;

  AuthRepository({required this.authWebServices});

  Future<LoginResponse> signUp(AuthModel authModel) async {
  try {
    final response = await authWebServices.signUp(authModel);
    return LoginResponse.fromJson(response); // تحويل مباشر
  } catch (e) {
    throw Exception("$e");
  }
}

  Future<LoginResponse> login(LoginRequest request) async {
    try {
      final response = await authWebServices.login(request);
      return response;
    } catch (e) {  
      throw Exception("$e");
    }
  }
}