import 'package:devloper_app/data/models/opportunity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JobCardO extends StatelessWidget {
  final JobCard job;

  const JobCardO({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey.shade200,
                  backgroundImage: job.companyLogo != null
                      ? NetworkImage(job.companyLogo!)
                      : null,
                  child: job.companyLogo == null
                      ? Icon(Icons.business,
                          color: const Color.fromARGB(255, 150, 155, 163))
                      : null,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    job.title ?? '',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.access_time, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Text(
                  job.postingDate ?? '',
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDetailRow('joاb role :', job.experienceLevel ?? ''),
                _buildDetailRow('job type :', job.yearsOfExperience ?? ''),
                _buildDetailRow(
                    ' Experience years:', job.yearsOfExperience ?? ''),
                _buildDetailRow(' job level:', job.yearsOfExperience ?? ''),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.location_on, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    '${job.companyName ?? ''} - ${job.location ?? ''}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Text(value),
        ],
      ),
    );
  }
}
