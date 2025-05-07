// part of 'opportunity_cubit.dart';

import 'package:devloper_app/data/models/oportunity.dart';

abstract class OpportunityState {}

class OpportunityInitial extends OpportunityState {}

class OpportunityLoading extends OpportunityState {}

class OpportunityLoaded extends OpportunityState {
  final Opportunity opportunity;

  OpportunityLoaded(this.opportunity);
}

class OpportunityError extends OpportunityState {
  final String message;

  OpportunityError(this.message);
}
