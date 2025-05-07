import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CompanyProfileCard extends StatelessWidget {
  final String? logo;
  final String name;
  final int? opportunityCount;
  final String address;
  final int employees;
  final String? description;
  final String? email;
  final String? website;
  final VoidCallback? onTap;

  const CompanyProfileCard({
    super.key,
    this.logo,
    required this.name,
    this.opportunityCount,
    required this.address,
    required this.employees,
    this.description,
    this.email,
    this.website,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 300,
        child: Card(
          color: Colors.white,
          clipBehavior: Clip.antiAlias,
          margin: const EdgeInsets.symmetric(vertical: 8),
          elevation: 6,
          shadowColor: const Color(0xFF6B1A6B),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.purple, width: 2),
                            shape: BoxShape.circle),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: (logo != null && logo!.isNotEmpty)
                              ? NetworkImage('http://localhost:8000$logo')
                              : const AssetImage('assets/images/IX_coder.jpg')
                                  as ImageProvider,
                          backgroundColor: Colors.grey[200],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          name,
                          style: const TextStyle(
                              fontSize: 21.3, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 70),
                          child: Row(
                            children: [
                               const SizedBox(height: 3),
                              const Icon(Icons.location_on_outlined,
                                  color: Colors.black, size: 22),
                              const SizedBox(width: 5),
                              const Text('Location',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15)),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  address,
                                  // overflow: TextOverflow.ellipsis,
                                  style:  TextStyle(
                                      color:Colors.grey[600],
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.business_center_outlined,
                              size: 23, color: Color(0xFF6B1A6B)),
                          const SizedBox(width: 9),
                          Text(
                            '${opportunityCount ?? 0} Opportunities',
                            style: const TextStyle(
                                color: Color(0xFF6B1A6B),
                                fontWeight: FontWeight.w600,
                                fontSize: 15),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 13),
                  Divider(color: Colors.grey[300]),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Icon(Icons.group, color: Colors.black, size: 22),
                      const SizedBox(width: 9),
                      const Text('Company Size',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 15)),
                      const SizedBox(width: 12),
                      Text('$employees employee',
                          style:  const TextStyle(
                              color:  Colors.grey,
                              fontWeight: FontWeight.w500,
                              fontSize: 14)),
                    ],
                  ),
                  if (email != null && email!.isNotEmpty) ...[
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Icon(Icons.email_outlined,
                            color: Colors.black, size: 22),
                        const SizedBox(width: 9),
                        const Text('Email',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 15)),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            email!,
                            overflow: TextOverflow.ellipsis,
                            style:  TextStyle(
                                color:Colors.grey[600],
                                fontWeight: FontWeight.w500,
                                fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ],
                  if (website != null && website!.isNotEmpty) ...[
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Icon(Icons.language,
                            color: Colors.black, size: 22),
                        const SizedBox(width: 9),
                        const Text('Website',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 15)),
                        const SizedBox(width: 10),
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              final Uri url = Uri.parse(
                                  website!.startsWith('http')
                                      ? website!
                                      : 'http://${website!}');
                              if (await canLaunchUrl(url)) {
                                await launchUrl(
                                  url,
                                  mode: LaunchMode.externalApplication,
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Could not open website')),
                                );
                              }
                            },
                            child: Text(
                              website!,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                  // if (description != null && description!.isNotEmpty) ...[
                  //   const SizedBox(height: 25),
                  //   const Row(
                  //     children: [
                  //       Icon(Icons.description_outlined,
                  //           color: Colors.black, size: 22),
                  //       SizedBox(width: 5),
                  //       Text('Company File',
                  //           style: TextStyle(
                  //               color: Colors.black,
                  //               fontWeight: FontWeight.w600,
                  //               fontSize: 17)),
                  //     ],
                  //   ),
                  //   const SizedBox(height: 8),
                  //   Text(
                  //     description!,
                  //     style: const TextStyle(
                  //         color:Colors.black38,
                  //         fontWeight: FontWeight.w500,
                  //         fontSize: 15),
                  //   ),
                  // ],
                  // const SizedBox(height: 3),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
