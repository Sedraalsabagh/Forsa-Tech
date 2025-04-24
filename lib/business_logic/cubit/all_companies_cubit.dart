import 'package:devloper_app/data/models/All_company.dart';
import 'package:devloper_app/data/repository/All_company.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'all_companies_state.dart';

class AllCompanyCubit extends Cubit<AllCompanyState> {
  final AllCompanyRepository repository;

  AllCompanyCubit(this.repository) : super(AllCompanyInitial());

  void fetchAllCompanies() async {
    try {
      emit(AllCompanyLoading());
      final companies = await repository.getAllCompanies();
      emit(AllCompanyLoaded(companies));
    } catch (e) {
      emit(AllCompanyError(e.toString()));
    }
  }
}
