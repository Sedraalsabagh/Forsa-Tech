import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  int _selectedIndex = -1;

  Widget buildContactButton(
      int index, IconData icon, String text, Color iconColor) {
    bool isSelected = index == _selectedIndex;

    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _selectedIndex = index;
        });
      },
      onTapUp: (_) {
        Future.delayed(const Duration(milliseconds: 150), () {
          setState(() {
            _selectedIndex = -1;
          });

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Navigated to "$text"')),
          );
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        transform: Matrix4.identity()..scale(isSelected ? 1.03 : 1.0),
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.red[50] : Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: isSelected ? Colors.red.withOpacity(0.3) : Colors.black12,
              blurRadius: 6,
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: iconColor),
            const SizedBox(width: 12),
            Text(text, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }

  Widget buildSocialIcon(IconData icon, String name) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Opening $name')),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 4),
          ],
        ),
        child: Icon(icon, size: 28, color: Colors.grey[800]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildContactButton(
                0, Icons.phone, "Call us 0932420760", Colors.red),
            buildContactButton(1, Icons.email, "Send us email", Colors.red),
            buildContactButton(2, Icons.link, "Visit our website", Colors.red),
            const SizedBox(height: 30),
            const Text(
              "Find us on",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                buildSocialIcon(FontAwesomeIcons.facebookF, "Facebook"),
                buildSocialIcon(FontAwesomeIcons.linkedinIn, "LinkedIn"),
                buildSocialIcon(FontAwesomeIcons.instagram, "Instagram"),
                buildSocialIcon(FontAwesomeIcons.youtube, "YouTube"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
