import 'package:devloper_app/data/models/All_company.dart';

abstract class AllCompanyState {}

class AllCompanyInitial extends AllCompanyState {}

class AllCompanyLoading extends AllCompanyState {}

class AllCompanyLoaded extends AllCompanyState {
  final List<AllCompany> companies;

  AllCompanyLoaded(this.companies);
}

class AllCompanyError extends AllCompanyState {
  final String error;

  AllCompanyError(this.error);
}
