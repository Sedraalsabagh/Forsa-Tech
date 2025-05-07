import 'package:bloc/bloc.dart';
import 'package:devloper_app/business_logic/cubit/auth_state.dart';
import 'package:devloper_app/data/repository/auth.dart';
import '../../data/models/auth.dart';


class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;

  AuthCubit(this.authRepository) : super(AuthInitial());

  Future<void> signUp(AuthModel authModel,
      {required String email,
      required String username,
      required String password}) async {
    emit(AuthLoading());
    try {
   final response = await authRepository.signUp(authModel);
emit(AuthSuccess(response)); // بدون تحويل

    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      final request = LoginRequest(email: email, password: password);
      final response = await authRepository.login(request);
      emit(AuthSuccess(response)); // لا حاجة للتحويل هنا
    } catch (e) {
      emit(AuthFailure(e.toString()));
      print("Login failed: $e");
    }
  }
}



