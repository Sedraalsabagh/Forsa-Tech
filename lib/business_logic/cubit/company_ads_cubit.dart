import 'package:devloper_app/business_logic/cubit/company_ads_state.dart';
import 'package:devloper_app/data/repository/company_ads.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompanyCubit extends Cubit<CompanyState> {
  final CompanyRepository companyRepository;

  CompanyCubit(this.companyRepository) : super(CompanyInitial());

  Future<void> fetchCompanies() async {
    try {
      emit(CompanyLoading());
      final companies = await companyRepository.fetchCompanies();
      emit(CompanyLoaded(companies: companies));
    } catch (e) {
      emit(CompanyError(message: e.toString()));
    }
  }
}

