import 'package:devloper_app/data/models/complaint.dart';
import 'package:devloper_app/data/webService/complaintWebservices.dart';

class ComplaintRepository {
  final ComplaintWebService webService;

  ComplaintRepository({required this.webService});

  Future<void> submitComplaint({
    required String title,
    String? description,
  }) async {
    final complaint = Complaint(
      title: title,
      description: description,
    );
    await webService.postComplaint(complaint);
  }
}
