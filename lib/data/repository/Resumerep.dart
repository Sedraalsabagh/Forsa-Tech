import 'package:devloper_app/data/models/resumemodel.dart';
import 'package:devloper_app/data/webService/generateWebservice.dart';

class CVRepository {
  final CVWebServices cvWebServices;

  CVRepository(this.cvWebServices);

  Future<Map<String, dynamic>> createResume1(ResumeModel resume) async {
    return await cvWebServices.createResume1(resume);
  }

  //
  // Future<List<ResumeModel>> getAllResumes() async { ... }
  // Future<ResumeModel> getResumeById(String id) async { ... }
  // Future<bool> deleteResume(String id) async { ... }
}
