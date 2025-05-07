import 'package:devloper_app/data/repository/complaint.dart';
import 'package:devloper_app/data/webService/complaintWebservices.dart';
import 'package:devloper_app/presentaion/screen/token_manger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'complaint_state.dart';

class ComplaintCubit extends Cubit<ComplaintState> {
  final ComplaintRepository repository;
  String? _accessToken;

  ComplaintCubit({required String accessToken})
      : _accessToken = accessToken.isEmpty ? null : accessToken,
        repository = ComplaintRepository(
          webService: ComplaintWebService(
              accessToken: accessToken.isEmpty ? null : accessToken),
        ),
        super(ComplaintState());

  Future<void> loadToken() async {
    _accessToken = await TokenManager.getAccessToken();
    if (_accessToken != null) {
      repository.webService.updateToken(_accessToken!);
    }
  }

  Future<void> submitComplaint({
    required String title,
    String? description,
  }) async {
    if (title.isEmpty) return;
    
    // التحقق من وجود توكن
    if (_accessToken == null) {
      await loadToken();
      if (_accessToken == null) {
        emit(state.copyWith(
          status: ComplaintStatus.failure,
          error: 'يجب تسجيل الدخول أولاً',
        ));
        return;
      }
    }

    emit(state.copyWith(status: ComplaintStatus.loading));
    try {
      await repository.submitComplaint(title: title, description: description);
      emit(state.copyWith(status: ComplaintStatus.success));
    } catch (e) {
      emit(state.copyWith(status: ComplaintStatus.failure, error: e.toString()));
    }
  }
}
