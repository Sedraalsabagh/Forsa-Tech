import 'package:devloper_app/business_logic/cubit/job_card_cubit.dart';
import 'package:devloper_app/presentaion/screen/widget/jobCard.dart';
import 'package:devloper_app/presentaion/screen/widget/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Searchjobscreen extends StatefulWidget {
  const Searchjobscreen({super.key});

  @override
  State<Searchjobscreen> createState() => _SearchjobscreenState();
}

class _SearchjobscreenState extends State<Searchjobscreen> {
  @override
  void initState() {
    super.initState();

    context.read<JobCardCubit>().getJobCards();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 200,
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 163, 120, 165),
                  Color.fromARGB(255, 252, 251, 252)
                ],
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Build your dream job here',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                    fontWeight: FontWeight.w100,
                  ),
                ),
                SizedBox(height: 20),
                CustomSearch(
                  icon: CupertinoIcons.search,
                  gradientColors: [Color(0xFF4A154B), Color(0xFF6B1A6B)],
                  hint: "Search your job",
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<JobCardCubit, JobCardState>(
              builder: (context, state) {
                if (state is JobCardLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is JobCardLoaded) {
                  final jobList = state.jobCards;
                  if (jobList.isEmpty) {
                    return const Center(child: Text("No jobs available"));
                  }
                  return ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: jobList.length,
                    itemBuilder: (context, index) {
                      return JobCardO(job: jobList[index]);
                    },
                  );
                } else if (state is JobCardError) {
                  return Center(child: Text("Error: ${state.message}"));
                } else {
                  return const Center(child: Text("Something went wrong"));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
