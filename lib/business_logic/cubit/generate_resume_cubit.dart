// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:devloper_app/data/models/resumemodel.dart';
// import 'package:devloper_app/data/repository/cv_repository.dart';
// import 'cv_state.dart';

// class CVCubit extends Cubit<CVState> {
//   final CVRepository repository;

//   CVCubit(this.repository) : super(CVInitial());

//   Future<void> createResume(ResumeModel resume) async {
//     emit(CVLoading());
//     try {
//       final result = await repository.createResume(resume);
//       if (result['success']) {
//         emit(CVSuccess(result['message'], result['data']));
//       } else {
//         emit(CVError(result['message']));
//       }
//     } catch (e) {
//       emit(CVError(e.toString()));
//     }
//   }
// }
