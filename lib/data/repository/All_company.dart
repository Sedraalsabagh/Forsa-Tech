import 'package:devloper_app/data/models/All_company.dart';
import 'package:devloper_app/data/webService/AllcompanyWebservices.dart';

class AllCompanyRepository {
  final AllCompanyWebService webService;

  AllCompanyRepository(this.webService);

  Future<List<AllCompany>> getAllCompanies() {
    return webService.fetchAllCompanies();
  }
}
