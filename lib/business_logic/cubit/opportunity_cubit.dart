// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:devloper_app/data/models/oportunity.dart';
// import 'package:devloper_app/data/repository/jobrepository.dart';


// class OpportunityCubit extends Cubit<OpportunityState> {
//   final OpportunityRepository _repository;

//   OpportunityCubit(this._repository) : super(OpportunityInitial());

//   Future<void> getOpportunityById(int id) async {
//     emit(OpportunityLoading());
//     try {
//       final opportunity = await _repository.fetchOpportunityById(id);
//       if (opportunity != null) {
//         emit(OpportunityLoaded(opportunity));
//       } else {
//         emit(OpportunityError("Opportunity not found"));
//       }
//     } catch (e) {
//       emit(OpportunityError(e.toString()));
//     }
//   }
// }
