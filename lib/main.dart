import 'package:devloper_app/business_logic/cubit/all_companies_cubit.dart';
import 'package:devloper_app/business_logic/cubit/auth_cubit.dart';
import 'package:devloper_app/business_logic/cubit/company_ads_cubit.dart';
import 'package:devloper_app/business_logic/cubit/evaluations_cubit.dart';
import 'package:devloper_app/business_logic/cubit/job_card_cubit.dart';
import 'package:devloper_app/business_logic/cubit/recommentaion_cubit.dart';
import 'package:devloper_app/data/repository/auth.dart';
import 'package:devloper_app/data/repository/company_ads.dart';
import 'package:devloper_app/data/repository/All_company.dart';
import 'package:devloper_app/data/repository/evaluation.dart';
import 'package:devloper_app/data/repository/jobrepository.dart';
import 'package:devloper_app/data/repository/recommendation.dart';
import 'package:devloper_app/data/webService/AllcompanyWebservices.dart';
import 'package:devloper_app/data/webService/adsWebservices.dart';
import 'package:devloper_app/data/webService/auth.dart';
import 'package:devloper_app/data/webService/evaluationWebServices.dart';
import 'package:devloper_app/data/webService/jobwebservices.dart';
import 'package:devloper_app/data/webService/recommendation.dart';
import 'package:devloper_app/presentaion/screen/ResumeEvaluator.dart';
import 'package:flutter/material.dart';
import 'package:devloper_app/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'business_logic/cubit/cv_cubit.dart';
import 'data/repository/CVRepository.dart';
import 'data/webService/CVWebServices.dart';

void main() {
  final appRouter = AppRouter();

  print("\n---------------------------------\n");
  print(ResumeEvaluatorApp);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<JobCardCubit>(
          create: (context) => JobCardCubit(
            JobCardRepository(WebServicesJobCard()), ////
          ),
        ),
        BlocProvider<ResumeCubit>(
          create: (context) => ResumeCubit(
            ResumeRepository(ResumeWebServices()), ////
          ),
        ),
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(
            AuthRepository(authWebServices: AuthWebServices()),
          ),
        ),
        BlocProvider(
          create: (context) => RecommendationCubit(
            RecommendationRepository(
                recommendationWebServices: (RecommendationWebServices())),
          ),
        ),
        BlocProvider(
          create: (context) =>
              CvCubit(CVRepository(cvWebServices: CVWebServices())),
        ),
         BlocProvider( create: (context) => CompanyCubit(CompanyRepository(CompanyWebService())),),
       BlocProvider<AllCompanyCubit>(
  create: (context) => AllCompanyCubit(AllCompanyRepository(AllCompanyWebService())),
),

         
      ],
      child: MyWidget(appRouter: appRouter),
    ),
  );
}

class MyWidget extends StatelessWidget {
  final AppRouter appRouter;

  const MyWidget({Key? key, required this.appRouter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
      initialRoute: '/',
    );
  }
}
