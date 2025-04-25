import 'package:flutter/material.dart';

class AboutJobWidget extends StatelessWidget {
  final String description;

  const AboutJobWidget({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("About the Job",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Text(
          description,
          style: const TextStyle(height: 1.5, fontSize: 15),
        ),
      ],
    );
  }
}
