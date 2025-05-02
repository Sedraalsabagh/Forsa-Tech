import 'package:devloper_app/constants/Colors.dart';
import 'package:devloper_app/data/models/oportunity.dart';
import 'package:flutter/material.dart';

class ForsaDetailsWidget extends StatelessWidget {
  final Opportunity opportunity;

  const ForsaDetailsWidget({
    super.key,
    required this.opportunity,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Forsa Details",
                style: TextStyle(
                    fontSize: 20,
                    // fontWeight: FontWeight.bold,
                    color: MyColors.myText)),
            const SizedBox(height: 16),
            infoRow(Icons.work_outline, "Experience",
                opportunity.yearsOfExperience ?? ''),
            const Divider(
              color: Colors.grey,
              thickness: 1,
              indent: 25,
              endIndent: 25,
            ),
            infoRow(
                Icons.school, "Education", opportunity.educationLevel ?? ''),
            const Divider(
              color: Colors.grey,
              thickness: 1,
              indent: 25,
              endIndent: 25, //
            ),
            infoRow(Icons.access_time, "Job Type",
                opportunity.employmentType ?? ''),
            const Divider(
              color: Colors.grey,
              thickness: 1, //
              indent: 25,
              endIndent: 25,
            ),
            infoRow(Icons.language, "Languages",
                opportunity.languagesRequired ?? ''),
            const Divider(
              color: Colors.grey,
              thickness: 1,
              indent: 25,
              endIndent: 25,
            ),
            infoRow(Icons.leaderboard, "Job Level",
                opportunity.certifications ?? ''),
          ],
        ),
      ),
    );
  }
}

Widget infoRow(IconData icon, String title, String value) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: Row(
      children: [
        Icon(icon, size: 18, color: const Color.fromARGB(255, 10, 10, 10)),
        const SizedBox(width: 20),
        Text("$title : ",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
        const SizedBox(width: 150),
        Expanded(
            child: Text(
          value,
          style: TextStyle(fontSize: 11),
        )),
      ],
    ),
  );
}
