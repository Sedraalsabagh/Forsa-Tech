import 'package:devloper_app/presentaion/screen/All_companies.dart';
import 'package:devloper_app/presentaion/screen/searchJobScreen.dart';
import 'package:flutter/material.dart';
import '../Home.dart';
import 'package:devloper_app/presentaion/screen/ResumeEvaluator.dart';
import '../welcomeBot.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int myCurrentIndex = 2;
  final List<Widget> pages = [
    const Searchjobscreen(),
    const AllCompanyScreen(),
    const HomePage(),
    ResumeEvaluatorApp(),
    const Welcomebot(),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: pages[myCurrentIndex],
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.4),
                blurRadius: 30,
                offset: const Offset(0, 20))
          ]),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: BottomNavigationBar(
              currentIndex: myCurrentIndex,
              backgroundColor: Colors.white,
              selectedItemColor: const Color(0xFF6B1A6B),
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
                  icon: Icon(Icons.search),
                  label: "Search",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.business),
                  label: "Companies",
                ),
                 BottomNavigationBarItem(
                  icon: Icon(Icons.home_rounded),
                  label: "Home",
                ),
                 BottomNavigationBarItem(
                  icon: Icon(Icons.playlist_add_check_sharp),
                  label: "Evaluate",
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


// import 'package:devloper_app/presentaion/screen/All_companies.dart';
// import 'package:devloper_app/presentaion/screen/searchJobScreen.dart';
// import 'package:flutter/material.dart';
// import '../Home.dart';
// import 'package:devloper_app/presentaion/screen/ResumeEvaluator.dart';
// import '../welcomeBot.dart';

// class BottomNavigation extends StatefulWidget {
//   const BottomNavigation({super.key});

//   @override
//   State<BottomNavigation> createState() => _BottomNavigationState();
// }
// class _BottomNavigationState extends State<BottomNavigation> {
 
//   int myCurrentIndex = 2;

//   final List<Widget> pages = [
//     const Searchjobscreen(),    
//     const AllCompanyScreen(),   
//     const HomePage(),           
//     ResumeEvaluatorApp(),      
//     const Welcomebot(),        
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
     
//       body: pages[myCurrentIndex],

//       bottomNavigationBar: Container(
//         margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//         decoration: BoxDecoration(boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.4),
//             blurRadius: 30,
//             offset: const Offset(0, 20),
//           )
//         ]),
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(30),
//           child: BottomNavigationBar(
//             type: BottomNavigationBarType.fixed,
//             currentIndex: myCurrentIndex,
//             backgroundColor: Colors.white,
//             selectedItemColor: const Color(0xFF6B1A6B),
//             unselectedItemColor: Colors.black,
//             showSelectedLabels: true,
//             showUnselectedLabels: false,
//             onTap: (index) => setState(() => myCurrentIndex = index),
//             items: const [
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.search),
//                 label: "Search",
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.business),
//                 label: "Companies",
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.home), 
//                 label: "Home",
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.assessment),
//                 label: "Resume",
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.chat, size: 30),
//                 label: "Mulhum",
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
