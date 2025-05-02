import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; 
import 'package:devloper_app/data/models/All_company.dart';

class CompanyDetailScreen extends StatelessWidget {
  final AllCompany company;

  const CompanyDetailScreen({super.key, required this.company});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 4,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              expandedHeight: 200,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  alignment: Alignment.center,
                  children: [
                    company.logo != null
                        ? Image.network(
                            'http://localhost:8000${company.logo}',
                            width: double.infinity,
                            fit: BoxFit.cover,
                          )
                        : Image.asset("assets/images/RareWeb.jpg"),
                  ],
                ),
              ),
            ),
          ],
body: Column(
  children: [
 Builder(
  builder: (context) {
    final TabController controller = DefaultTabController.of(context)!;
    return AnimatedBuilder(
      animation: controller.animation!,
      builder: (context, child) {
        final delta = (controller.animation!.value - controller.index).abs();
        final opacity = 1.0 - (delta * 0.5);
        return Opacity(
          opacity: opacity.clamp(0.0, 1.0),
          child: child,
        );
      },
      child: Container(
        color: Colors.white, 
        child: TabBar(
          controller: controller,
          dividerColor: const Color.fromARGB(255, 221, 162, 221),
          labelColor: Colors.black87,
          labelStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
          indicatorColor: const Color(0xFF6B1A6B),
          tabs: const [
            Tab(text: "About Company"),
            Tab(text: "Opportunities"),
          ],
        ),
      ),
    );
  },
),


    Expanded(
      child: TabBarView(
        children: [
          _buildAboutCompany(company),
          _buildJobsTab(),
        ],
      ),
    ),
  ],
),

        ),
      ),
    );
  }

  Widget _buildAboutCompany(AllCompany company) {
    return Container(
      color: const Color.fromARGB(255, 232, 236, 252),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(17),
            child: Card(
              color: Colors.white,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (company.description != null &&
                        company.description!.isNotEmpty) ...[
                      const Text(
                        "Company File",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        company.description!,
                        style: const TextStyle(
                            fontSize: 16, color: Colors.black54),
                      ),
                      const Divider(height: 32, thickness: 1),
                    ],
                    _buildInfoRow(Icons.location_pin, company.address),
                    const SizedBox(height: 12),
                    _buildInfoRow(
                        Icons.people, '${company.employees} employee'),
                    const SizedBox(height: 12),
                    _buildWebsiteRow(company.website),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Icon(
            icon,
            color: const Color(0xFF6B1A6B),
            size: 20,
          ),
          const SizedBox(width: 8),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 16))),
        ],
      ),
    );
  }

  Widget _buildWebsiteRow(String? website) {
    if (website == null || website.isEmpty) {
      return _buildInfoRow(Icons.language, "The Website is not found ");
    }
    return GestureDetector(
      onTap: () async {
        final uri = Uri.parse(website);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        }
      },
      child: _buildInfoRow(Icons.language, website),
    );
  }

  Widget _buildJobsTab() {
    final jobs = [
      {'title': 'مهندس شبكات', 'location': 'دمشق'},
      {'title': 'محاسب مالي', 'location': 'حلب'},
      {'title': 'مسؤول تسويق', 'location': 'اللاذقية'},
    ];
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: jobs.length,
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final job = jobs[index];
        return Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 6,
              ),
            ],
          ),
          child: ListTile(
            leading: const Icon(Icons.work, color: Colors.blue),
            title: Text(job['title'] ?? ''),
            subtitle: Text(job['location'] ?? ''),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
        );
      },
    );
  }
}
