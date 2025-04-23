import 'package:devloper_app/business_logic/cubit/company_ads_cubit.dart';
import 'package:devloper_app/business_logic/cubit/job_opportunities_cubit.dart';
import 'package:devloper_app/business_logic/cubit/job_opportunities_state.dart';
import 'package:devloper_app/business_logic/cubit/recommentaion_cubit.dart';
import 'package:devloper_app/constants/Colors.dart';
import 'package:devloper_app/data/repository/Job_opportunities.dart';
import 'package:devloper_app/presentaion/screen/Job_opportunities.dart';
import 'package:devloper_app/presentaion/screen/NavBar.dart';
import 'package:devloper_app/presentaion/screen/widget/company_ads.dart';
import 'package:devloper_app/presentaion/screen/widget/opportunity_reco.dart';
import 'package:devloper_app/presentaion/screen/widget/promotion_banner.dart';
import 'package:devloper_app/presentaion/screen/widget/user_greeting.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // لتأثير FadeInUp

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> jobImages = [
    'dev1.jpg',
    'dev2.jpg',
    'dev3.jpg',
    'dev4.jpg'
  ];
  @override
  void initState() {
    super.initState();
    // context.read<RecommendationCubit>().fetchRecommendations();
   context.read<CompanyCubit>().fetchCompanies();
  }

  Widget showLoadingIndicator() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Image.asset(
          'assets/images/Animation.gif',
          width: 150,
          height: 150,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const UserGreeting(username: "SedraAlsabbagh"),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications, color: Colors.black),
                onPressed: () {},
              ),
              Positioned(
                right: 20,
                top: 10,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      drawer: const Navbar(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: FadeInDown(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const PromotionBanner(),
                  const SizedBox(height: 18),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:EdgeInsets.only(left: 10),
                        child: Text(
                          "The best companies ",
                          style: TextStyle(
                            fontSize: 19,
                            // letterSpacing: 0.2,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const CompanyAds(),
                  const SizedBox(height: 22),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Recommended for you",
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF7E1E7E),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 190,
                    child: BlocBuilder<RecommendationCubit, RecommendationState>(
                      builder: (context, state) {
                        if (state is RecommendationInitial) {
                          return Center(child: showLoadingIndicator());
                        } else if (state is RecommendationLoaded) {
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.all(16),
                            itemCount: state.recommendations.length,
                            itemBuilder: (context, index) {
                              final jobs = state.recommendations[index];
                              final imageName = jobImages[index %
                                  jobImages.length]; 
              
                              return SizedBox(
                                width: 250,
                                child: JobCard(
                                  key: ValueKey('${jobs.title}-${jobs.date}'),
                                  title: jobs.title,
              
                                  imageUrl: imageName,
                                  date: '', 
                                ),
                              );
                            },
                          );
                        } else if (state is RecommendationError) {
                          return Center(child: Text(state.message));
                        }
                        return Container();
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
