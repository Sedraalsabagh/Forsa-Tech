import 'package:devloper_app/constants/Colors.dart';
import 'package:flutter/material.dart';

class ForsaDetailsWidget extends StatelessWidget {
  final String experience;
  final String education;
  final String jobType;
  final String languages;
  final String level;

  const ForsaDetailsWidget({
    super.key,
    required this.experience,
    required this.education,
    required this.jobType,
    required this.languages,
    required this.level,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Forsa Details",
              style: TextStyle(
                  fontSize: 20,
                  // fontWeight: FontWeight.bold,
                  color: MyColors.myText)),
          const SizedBox(height: 16),
          infoRow(Icons.work_outline, "Experience", experience),
          const Divider(
            color: Colors.grey,
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
          infoRow(Icons.school, "Education", education),
          const Divider(
            color: Colors.grey,
            thickness: 1,
            indent: 20,
            endIndent: 20, //
          ),
          infoRow(Icons.access_time, "Job Type", jobType),
          const Divider(
            color: Colors.grey,
            thickness: 1, //
            indent: 20,
            endIndent: 20,
          ),
          infoRow(Icons.language, "Languages", languages),
          const Divider(
            color: Colors.grey,
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
          infoRow(Icons.leaderboard, "Job Level", level),
        ],
      ),
    );
  }
}

Widget infoRow(IconData icon, String title, String value) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: Row(
      children: [
        Icon(icon, color: Colors.indigo),
        const SizedBox(width: 10),
        Text("$title: ", style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(width: 4),
        Expanded(child: Text(value)),
      ],
    ),
  );
}
