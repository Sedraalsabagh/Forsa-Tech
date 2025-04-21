import 'package:devloper_app/data/webService/jobwebservices.dart';

import '../models/opportunity.dart';

class JobCardRepository {
  final WebServicesJobCard webServicesJobCard;

  JobCardRepository(this.webServicesJobCard);

  Future<List<JobCard>> fetchJobCards() async {
    return await webServicesJobCard.getJobCards();
  }
}
