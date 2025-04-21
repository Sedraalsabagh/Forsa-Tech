import 'package:devloper_app/data/models/company_ads.dart';

abstract class CompanyState {}

class CompanyInitial extends CompanyState {}

class CompanyLoading extends CompanyState {}

class CompanyLoaded extends CompanyState {
  final List<Company> companies;

  CompanyLoaded({required this.companies});
}

class CompanyError extends CompanyState {
  final String message;

  CompanyError({required this.message});
}
