import 'package:devloper_app/business_logic/cubit/all_companies_cubit.dart';
import 'package:devloper_app/business_logic/cubit/all_companies_state.dart';
import 'package:devloper_app/presentaion/screen/CompanyDetailScreen.dart';
import 'package:devloper_app/presentaion/screen/widget/company_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllCompanyScreen extends StatelessWidget {
  const AllCompanyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllCompanyCubit, AllCompanyState>(
      builder: (context, state) {
        if (state is AllCompanyInitial) {
          context.read<AllCompanyCubit>().fetchAllCompanies();
        }

        return Scaffold(
          body: Builder(
            builder: (_) {
              if (state is AllCompanyLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is AllCompanyLoaded) {
                final companies = state.companies;

                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: companies.length,
                  itemBuilder: (context, index) {
                    final company = companies[index];
                    return CompanyProfileCard(
                      logo: company.logo,
                      name: company.name,
                      opportunityCount: company.opportunityCount,
                      address: company.address,
                      employees: company.employees,
                      description: company.description,
                      email: company.email, 
                      website: company.website,
                       onTap: () {
         Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CompanyDetailScreen(company: company),));
      }, 
                    );
                  },
                );
              } else if (state is AllCompanyError) {
                return Center(child: Text('حدث خطأ: ${state.error}'));
              } else {
                return const SizedBox();
              }
            },
          ),
        );
      },
    );
  }
}
