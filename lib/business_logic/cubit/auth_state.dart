import '../../data/models/auth.dart';
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final LoginResponse response; // تغيير من Map إلى LoginResponse
  AuthSuccess(this.response);
}
class AuthLoggedIn extends AuthState {
  final String accessToken;
  
  AuthLoggedIn(this.accessToken);
}

class AuthFailure extends AuthState {
  final String error;
  AuthFailure(this.error);
}