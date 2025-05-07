import 'package:devloper_app/constants/Colors.dart';
import 'package:flutter/material.dart';

class AboutJobWidget extends StatelessWidget {
  final String description;

  const AboutJobWidget({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16), // نفس انحناء Forsa Details
        side: BorderSide(color: Colors.grey.shade300), // إطار خفيف
      ),
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "About the Job",
              style: TextStyle(
                fontSize: 20,
                color: MyColors.myText,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              description,
              style: const TextStyle(
                fontSize: 15,
                height: 1.6,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
