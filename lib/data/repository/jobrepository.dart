import 'package:devloper_app/data/models/oportunity.dart';
import 'package:devloper_app/data/webService/jobwebservices.dart';
import '../models/opportunity.dart';

class JobCardRepository {
  final WebServicesJobCard webServicesJobCard;

  JobCardRepository(this.webServicesJobCard);

  Future<List<JobCard>> fetchJobCards() async {
    return await webServicesJobCard.getJobCards();
  }
}

class OpportunityRepository {
  final WebServicesJobCard webServicesJobCard;

  OpportunityRepository(this.webServicesJobCard);

  Future<Opportunity?> fetchOpportunityById(int id) async {
    return await webServicesJobCard.getOpportunityById(id);
  }
}
