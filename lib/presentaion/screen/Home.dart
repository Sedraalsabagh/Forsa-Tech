import 'package:devloper_app/constants/Colors.dart';
// import 'package:devloper_app/presentaion/screen/NavBar.dart';
import 'package:devloper_app/presentaion/screen/widget/bouttom_navigation.dart';
import 'package:devloper_app/presentaion/screen/widget/opportunity_reco.dart';
import 'package:flutter/material.dart';

import 'NavBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> jobs = [
    {
      "title": "Business Analyst",
      "date": "26 Apr, 6:30 PM",
      "image": "assets/images/forsa2.jpg"
    },
    {
      "title": "Web devloper",
      "date": "26 Apr, 6:30 PM",
      "image": "assets/images/forsa3.jpg"
    },
    {
      "title": "Mobile devloper",
      "date": "26 Apr, 6:30 PM",
      "image": "assets/images/forsa3.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const UserGreeting(username: " SedraAlsabbagh"),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications, color: Colors.black),
                onPressed: () {},
              ),
              Positioned(
                right: 20,
                top: 10,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 238, 19, 19),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      drawer: const Navbar(),
      backgroundColor: const Color.fromARGB(255, 255, 253, 253),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      height: 180,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 138, 41, 138),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Do you need",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                "advice to learn",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                "a new skill",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: MyColors.myText,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: const Text("Yes, I want"),
                              ),
                            ],
                          )),
                          const SizedBox(width: 10),
                          Positioned(
                            right: -10,
                            top: -20,
                            child: Image.asset(
                              'assets/images/test2-removebg-preview.png',
                              width: 230,
                              height: 190,
                              fit: BoxFit.contain,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "The best companies ",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "See All",
                            style: TextStyle(color: MyColors.myText),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const CompanyAdsWidget(),
                    const SizedBox(height: 12),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: jobs.length,
                      itemBuilder: (context, index) {
                        final job = jobs[index];
                        return JobCard(
                          title: job["title"]!,
                          date: job["date"]!,
                          imageUrl: job["image"]!,
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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

class CompanyAdsWidget extends StatefulWidget {
  const CompanyAdsWidget({super.key});

  @override
  State<CompanyAdsWidget> createState() => _CompanyAdsWidgetState();
}

class _CompanyAdsWidgetState extends State<CompanyAdsWidget> {
  final List<Map<String, String>> companies = [
    {"name": "View ", "logo": "assets/images/RareWeb.jpg"},
    {"name": "SyrianCenter", "logo": "assets/images/RareWeb.jpg"},
    {"name": "RareWeb", "logo": "assets/images/RareWeb.jpg"},
    {"name": "HomeArab", "logo": "assets/images/RareWeb.jpg"},
    {"name": "IXCoder", "logo": "assets/images/RareWeb.jpg"},
    {"name": "View ", "logo": "assets/images/RareWeb.jpg"},
    {"name": "IXCoder", "logo": "assets/images/RareWeb.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: companies.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Column(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[200],
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      companies[index]["logo"]!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  companies[index]["name"]!,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
