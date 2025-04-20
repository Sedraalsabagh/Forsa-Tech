import 'package:devloper_app/presentaion/screen/convertCV.dart';
import 'package:devloper_app/presentaion/screen/quiz_screen.dart';
import 'package:devloper_app/presentaion/screen/widget/ListTitle.dart';
import 'package:flutter/material.dart';

import 'profile_screen.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // padding: EdgeInsets.symmetric(horizontal: 20),
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text("sedraAlsabbagh"),
            accountEmail: const Text("SedraAlsabbagh2021@gmail.com "),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  "assets/images/sedra.jpg",
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage("assets/images/sedra2.jpg"))),
          ),
          MyListTile(
            icon: Icons.favorite,
            title: "Favorites",
            onTap: () => print("Favorites clicked"),
          ),
          MyListTile(
            icon: Icons.create,
            title: "Create CV",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ProfileScreen()),
              );
            },
          ),
          MyListTile(
            icon: Icons.upload_file,
            title: "Upload CV",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ConvertCvScreen()),
              );
            }
          ),
             MyListTile(
            icon: Icons.quiz_sharp,
            title: "MCQ Quiz",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const QuizScreen()),
              );
            },
          ),
          //    MyListTile(
          //   icon: Icons.create,
          //   title: "Companies",
          //   onTap: () {
          //    print("company clicked ");
          //   },
          // ),
          const Divider(),
          MyListTile(
            icon: Icons.settings,
            title: "Settings",
            onTap: () => print("Settings clicked"),
          ),
          // MyListTile(
          //   icon: Icons.policy,
          //   title: "Policies",
          //   onTap: () => print("السياسة clicked"),
          // ),
          MyListTile(
            icon: Icons.logout,
            title: "Log Out",
            onTap: () => print("Log Out clicked"),
          ),
        ],
      ),
    );
  }
}
