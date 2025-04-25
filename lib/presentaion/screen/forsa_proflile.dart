import 'package:devloper_app/constants/Colors.dart';
import 'package:devloper_app/presentaion/screen/widget/Forsa_Details.dart';
import 'package:devloper_app/presentaion/screen/widget/OpportunityHeaderWidget.dart';
import 'package:devloper_app/presentaion/screen/widget/about_the_job.dart';
import 'package:flutter/material.dart';

class OpportunityDetailsScreen extends StatelessWidget {
  const OpportunityDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myText,
      body: SingleChildScrollView(
        child: Column(
          children: [
            OpportunityHeaderWidget(
              title: "QA Engineer",
              postedDate: "Posted 2 days ago",
              companyName: "CLOUDEV",
              location: "Damascus",
              logoUrl: "https://via.placeholder.com/40",
            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  ForsaDetailsWidget(
                    experience: "2 years",
                    education: "Bachelor Degree",
                    jobType: "Full time",
                    languages: "Arabic, English",
                    level: "Senior",
                  ),
                  SizedBox(height: 24),
                  AboutJobWidget(
                    description:
                        "As a QA Engineer, you will be responsible for testing our mobile and web applications...",
                  ),
                  SizedBox(height: 24),
                  AboutJobWidget(
                    description:
                        "As a QA Engineer, you will be responsible for testing our mobile and web applications...",
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
