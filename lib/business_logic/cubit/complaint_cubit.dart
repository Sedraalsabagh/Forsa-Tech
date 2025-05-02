import 'package:devloper_app/data/repository/complaint.dart';
import 'package:devloper_app/data/webService/complaintWebservices.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'complaint_state.dart';

class ComplaintCubit extends Cubit<ComplaintState> {
  final ComplaintRepository repository;

  ComplaintCubit({required String accessToken})
      : repository = ComplaintRepository(
          webService: ComplaintWebService(accessToken: accessToken),
        ),
        super(ComplaintState());

  Future<void> submitComplaint({
    required String title,
    String? description,
  }) async {
    if (title.isEmpty) return;
    emit(state.copyWith(status: ComplaintStatus.loading));
    try {
      await repository.submitComplaint(title: title, description: description);
      emit(state.copyWith(status: ComplaintStatus.success));
    } catch (e) {
      emit(state.copyWith(status: ComplaintStatus.failure, error: e.toString()));
    }
  }
}