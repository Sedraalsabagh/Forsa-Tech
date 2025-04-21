import 'package:devloper_app/data/models/opportunity.dart';
import 'package:devloper_app/data/repository/jobrepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'job_card_state.dart';

class JobCardCubit extends Cubit<JobCardState> {
  final JobCardRepository jobCardRepository;

  JobCardCubit(this.jobCardRepository) : super(JobCardInitial());

  Future<void> getJobCards() async {
    try {
      emit(JobCardLoading());
      final jobCards = await jobCardRepository.fetchJobCards();
      emit(JobCardLoaded(jobCards));
    } catch (e) {
      emit(JobCardError(e.toString()));
    }
  }
}
