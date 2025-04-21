part of 'job_card_cubit.dart';

abstract class JobCardState {}

class JobCardInitial extends JobCardState {}

class JobCardLoading extends JobCardState {}

class JobCardLoaded extends JobCardState {
  final List<JobCard> jobCards;

  JobCardLoaded(this.jobCards);
}

class JobCardError extends JobCardState {
  final String message;

  JobCardError(this.message);
}
