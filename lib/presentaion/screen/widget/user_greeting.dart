import 'package:flutter/material.dart';
import 'package:devloper_app/constants/Colors.dart';

class UserGreeting extends StatelessWidget {
  final String username;
  const UserGreeting({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0, top: 16),
      child: Column(
        children: [
          Text("Hi, $username",
              style:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text("How are you today?", style: TextStyle(fontSize: 13)),
        ],
      ),
    );
  }
}