import 'package:devloper_app/business_logic/cubit/opportunity_cubit.dart';
import 'package:devloper_app/constants/Colors.dart';
import 'package:devloper_app/presentaion/screen/widget/Forsa_Details.dart';
import 'package:devloper_app/presentaion/screen/widget/OpportunityHeaderWidget.dart';
import 'package:devloper_app/presentaion/screen/widget/about_the_job.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//

class ForsaProfile extends StatefulWidget {
  final int id;

  const ForsaProfile({super.key, required this.id});

  @override
  State<ForsaProfile> createState() => _ForsaProfileState();
}

class _ForsaProfileState extends State<ForsaProfile> {
  @override
  void initState() {
    super.initState();
    context.read<OpportunityCubit>().getOpportunityById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myText,
      body: BlocBuilder<OpportunityCubit, OpportunityState>(
        builder: (context, state) {
          if (state is OpportunityLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is OpportunityLoaded) {
            final opportunity = state.opportunity;

            return SingleChildScrollView(
              child: Column(
                children: [
                  OpportunityHeaderWidget(opportunity: opportunity),
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(24)),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ForsaDetailsWidget(opportunity: opportunity),
                        const SizedBox(height: 24),
                        AboutJobWidget(
                          description: opportunity.description ??
                              "No description provided.",
                        ),
                        const SizedBox(height: 24),
                        AboutJobWidget(
                          description: opportunity.description ??
                              "No responsibilities provided.",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else if (state is OpportunityError) {
            return Center(child: Text(state.message));
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
