import 'package:flutter/material.dart';

class FAQPage extends StatefulWidget {
  @override
  _FAQPageState createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  final List<Map<String, String>> faqs = [
    {
      "question": "What is the Forsatech app?",
      "answer":
          "Forsatech is a smart app that helps you find educational or career opportunities based on your profile."
    },
    {
      "question": "How can I create a smart resume?",
      "answer":
          "You can use the 'Generate Resume' feature in the app. It analyzes your data and builds an ATS-compliant resume."
    },
    {
      "question": "Is the app free to use?",
      "answer":
          "Yes, the app is free, with some premium features that require a subscription."
    },
    {
      "question": "Can I link my GitHub or LinkedIn account?",
      "answer":
          "Absolutely! The app allows integration with GitHub and LinkedIn to offer personalized recommendations and professional analysis."
    },
    {
      "question": "What does ATS-compliant resume mean?",
      "answer":
          "ATS-compliant resumes are optimized to pass through automated hiring systems used by many companies."
    },
    {
      "question": "How do I get personalized job suggestions?",
      "answer":
          "Based on your resume, skills, and interests, Forsatech recommends job opportunities that best match your profile."
    },
    {
      "question": "Can I track the status of my applications?",
      "answer":
          "Yes, Forsatech allows you to monitor the progress of your submitted applications within the app."
    },
    {
      "question": "How secure is my data?",
      "answer":
          "Your data is securely stored and encrypted. We value your privacy and never share your information without consent."
    },
  ];

  int? _expandedIndex;

  final Color borderColor =
      Color(0xFF4A15F4); // Border & icon color when expanded

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: faqs.length,
        itemBuilder: (context, index) {
          final isExpanded = _expandedIndex == index;

          return AnimatedContainer(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isExpanded ? borderColor : Colors.transparent,
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                )
              ],
            ),
            margin: const EdgeInsets.only(bottom: 12),
            child: Theme(
              data: Theme.of(context).copyWith(
                dividerColor: Colors.transparent,
              ),
              child: ExpansionTile(
                leading: Icon(
                  Icons.question_mark_rounded,
                  color: isExpanded ? borderColor : Colors.black54,
                ),
                title: Text(
                  faqs[index]["question"]!,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 14
                    ,
                    color: Colors.black,
                  ),
                ),
                onExpansionChanged: (expanded) {
                  setState(() {
                    _expandedIndex = expanded ? index : null;
                  });
                },
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      faqs[index]["answer"]!,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                ],
                trailing: Icon(
                  Icons.expand_more,
                  color: isExpanded ? borderColor : Colors.black54,
                ),
                tilePadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
            ),
          );
        },
      ),
    );
  }
}
