import 'package:flutter/material.dart';

class OpportunityHeaderWidget extends StatelessWidget {
  final String title;
  final String postedDate;
  final String companyName;
  final String location;
  final String logoUrl;

  const OpportunityHeaderWidget({
    super.key,
    required this.title,
    required this.postedDate,
    required this.companyName,
    required this.location,
    required this.logoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.indigo[900],
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.calendar_today, color: Colors.white70, size: 16),
              const SizedBox(width: 4),
              Text(postedDate, style: const TextStyle(color: Colors.white70)),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              CircleAvatar(backgroundImage: NetworkImage(logoUrl)),
              const SizedBox(width: 8),
              Text(
                "$companyName · $location",
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                child:
                    const Text("Apply", style: TextStyle(color: Colors.indigo)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
