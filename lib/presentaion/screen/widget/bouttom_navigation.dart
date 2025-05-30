import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:devloper_app/presentaion/screen/All_companies.dart';
import 'package:devloper_app/presentaion/screen/searchJobScreen.dart';
import '../AllOpportunity.dart';
import '../Home.dart';
import 'package:devloper_app/presentaion/screen/ResumeEvaluator.dart';
import '../convertCV.dart';
import '../welcomeBot.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 2; // الافتراضي صفحة Home

  final List<Widget> _screens = const [
    AllCompanyScreen(),
    Searchjobscreen(),
    HomePage(),
    ResumeEvaluatorApp(),
    Welcomebot(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget buildNavItem(IconData icon, String label, int index) {
    final bool isSelected = _selectedIndex == index;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedScale(
            scale: isSelected ? 1.2 : 1.0,
            duration: const Duration(milliseconds: 200),
            child: FaIcon(
              icon,
              color: isSelected ?const Color(0xff9333EA): Colors.grey,
              size: isSelected ? 22 : 20,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isSelected ?const Color(0xff9333EA): Colors.grey,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, -1),
      )]),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () => _onItemTapped(0),
                child: buildNavItem(FontAwesomeIcons.building, "Companies", 0),
              ),
              GestureDetector(
                onTap: () => _onItemTapped(1),
                child: buildNavItem(FontAwesomeIcons.search, "Search", 1),
              ),
              GestureDetector(
                onTap: () => _onItemTapped(2),
                child: buildNavItem(FontAwesomeIcons.home, "Home", 2),
              ),
              GestureDetector(
                onTap: () => _onItemTapped(3),
                child: buildNavItem(FontAwesomeIcons.fileAlt, "Evaluate Resume", 3),
              ),
              GestureDetector(
                onTap: () => _onItemTapped(4),
                child: buildNavItem(FontAwesomeIcons.robot, "Mulhum", 4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}