class LoginRequest {
  final String email;
  final String password;

  LoginRequest({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}

class LoginResponse {
  final String accessToken;
  final String refreshToken;

  LoginResponse({
    required this.accessToken,
    required this.refreshToken,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    if (json['access'] == null || json['refresh'] == null) {
      throw Exception('Invalid response data');
    }
    return LoginResponse(
      accessToken: json['access'],
      refreshToken: json['refresh'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'access': accessToken,
      'refresh': refreshToken,
    };
  }
}


class AuthModel {
  final String email;
  final String password;
  final String? username;
  final String? confirmPassword;

  AuthModel({
    required this.email,
    required this.password,
    this.username,
    this.confirmPassword,
  });


  // هي تأكيدي منها مابعرف اذا صح من ارسال الى السيرفر لازم تعمل جيسون
  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
      "username": username,
      "confirmPassword": confirmPassword,
    };
  }
 //                        هي الباك عم يرجعلك وكمان انت بدك تحويلي لجيسون
  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      email: json["email"],
      password: json["password"],
      username: json["username"],
      confirmPassword: json["confirmPassword"],
    );
  }
}




