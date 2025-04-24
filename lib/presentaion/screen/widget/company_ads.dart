import 'package:devloper_app/business_logic/cubit/company_ads_cubit.dart';
import 'package:devloper_app/business_logic/cubit/company_ads_state.dart';
import 'package:devloper_app/presentaion/screen/All_companies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CompanyAds extends StatelessWidget {
  const CompanyAds({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompanyCubit, CompanyState>(
      builder: (context, state) {
        if (state is CompanyLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CompanyLoaded) {
          return SizedBox(
            height: 90,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.companies.length,
              itemBuilder: (context, index) {
                final company = state.companies[index];
                return Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: InkWell(                                    // ← استخدم InkWell
                    onTap: () {
    //                    Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (_) => AllCompanyScreen(companyId: company.id),
    //   ),
    // );
                    },
                    borderRadius: BorderRadius.circular(30),
                    child: Column(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color.fromARGB(255, 255, 208, 0),
                              width: 1.3,
                            ),
                            color: Colors.grey[800],
                          ),
                          child: ClipOval(
                            child: company.logoUrl != null && company.logoUrl!.isNotEmpty
                                ? Image.network(
                                    'http://localhost:8000${company.logoUrl!}',
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) =>
                                        const Icon(Icons.error),
                                  )
                                : Image.asset("assets/images/RareWeb.jpg"),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          company.name,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is CompanyError) {
          return Center(child: Text('Error: ${state.message}'));
        }
        return Container();
      },
    );
  }
}
