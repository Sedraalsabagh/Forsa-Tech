import 'package:flutter/material.dart';

class CompanyAds extends StatelessWidget {
  final List<Map<String, String>> companies = [
    {"name": "View", "logo": "assets/images/view.jpg"},
    {"name": "SyrianCenter", "logo": "assets/images/Syrian-center.jpg"},
    {"name": "RareWeb", "logo": "assets/images/RareWeb.jpg"},
    {"name": "HomeArab", "logo": "assets/images/HomeArab.jpg"},
    {"name": "IXCoder", "logo": "assets/images/IX_coder.jpg"},
  ];

   CompanyAds({super.key});



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
                      shape: BoxShape.circle, color: Colors.grey[200]),
                  child: ClipOval(
                    child: Image.asset(companies[index]["logo"]!,
                        fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  companies[index]["name"]!,
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
