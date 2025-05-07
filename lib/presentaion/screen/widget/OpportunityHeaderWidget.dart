import 'package:devloper_app/constants/Colors.dart';
import 'package:devloper_app/data/models/oportunity.dart';
import 'package:devloper_app/presentaion/screen/widget/applyDialog.dart';
import 'package:flutter/material.dart';

class OpportunityHeaderWidget extends StatelessWidget {
  final Opportunity opportunity;

  const OpportunityHeaderWidget({
    super.key,
    required this.opportunity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 116, 36, 116),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(opportunity.title ?? '',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.normal)),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(Icons.schedule, color: Colors.white70, size: 16),
              const SizedBox(width: 6),
              Text(opportunity.postingDate ?? '',
                  style: const TextStyle(
                      color: Color.fromARGB(179, 214, 183, 6), fontSize: 10)),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    showIncompleteProfileDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: Size(200, 40),
                  ),
                  child: const Text("Apply",
                      style: TextStyle(color: MyColors.myText)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



//  Row(
//             children: [
//               CircleAvatar(backgroundImage: NetworkImage(logoUrl)),
//               const SizedBox(width: 8),
//               Text(
//                 "$companyName · $location",
//                 style: const TextStyle(color: Colors.white, fontSize: 16),
//               ),
//               const Spacer(),
//             ],