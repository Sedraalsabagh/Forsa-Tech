import 'package:devloper_app/presentaion/screen/searchJobScreen.dart';
import 'package:flutter/material.dart';
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
  int myCurrentIndex = 0;
  final List<Widget> pages = const [
    HomePage(),
    Searchjobscreen(),
    Allopportunity(),
    ResumeEvaluatorApp(),
    Welcomebot(),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: pages[myCurrentIndex],
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.4),
                blurRadius: 30,
                offset: Offset(0, 20))
          ]),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: BottomNavigationBar(
              currentIndex: myCurrentIndex,
              backgroundColor: Colors.white,
              selectedItemColor: Color(0xFF6B1A6B),
              unselectedItemColor: Colors.black,
              selectedFontSize: 12,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              onTap: (index) {
                setState(() {
                  myCurrentIndex = index;
                });
              },
              
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: "Search",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.fact_check),
                  label: "Evaluate Resume",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.wechat, size: 34),
                  label: "Mulhum",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
