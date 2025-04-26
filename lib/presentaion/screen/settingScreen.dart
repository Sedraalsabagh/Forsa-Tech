import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            MenuItem(
              icon: Icons.description,
              text: 'Terms & Conditions',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) =>
                            DummyScreen(title: 'Terms & Conditions')));
              },
            ),
            MenuItem(
              icon: Icons.group_add,
              text: 'Invite Friends',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => DummyScreen(title: 'Invite Friends')));
              },
            ),
            MenuItem(
              icon: Icons.info_outline,
              text: 'About Forsa-Tech',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => DummyScreen(title: 'About FotsaTech')));
              },
            ),
            MenuItem(
              icon: Icons.chat_bubble_outline,
              text: 'FAQs',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => DummyScreen(title: 'FAQs')));
              },
            ),
            MenuItem(
              icon: Icons.settings,
              text: 'Settings',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => DummyScreen(title: 'Settings')));
              },
            ),
            MenuItem(
              icon: Icons.help_outline,
              text: 'Need help?',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => DummyScreen(title: 'Need help?')));
              },
            ),
            MenuItem(
              icon: Icons.login,
              text: 'Log in',
              color: Colors.red,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => DummyScreen(title: 'Log in')));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  final Color? color;

  const MenuItem({
    required this.icon,
    required this.text,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Icon(icon, color: color ?? Colors.black),
              SizedBox(width: 16),
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                    color: color ?? Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}

class DummyScreen extends StatelessWidget {
  final String title;

  const DummyScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 160, 38, 140),
        title: Text(title),
      ),
      body: Center(
        child: Text(
          'This is $title page!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
