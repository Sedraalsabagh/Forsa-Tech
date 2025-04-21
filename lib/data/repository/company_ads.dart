
import 'package:devloper_app/data/models/company_ads.dart';
import 'package:devloper_app/data/webService/adsWebservices.dart';

class CompanyRepository {
  final CompanyWebService companyWebService;

  CompanyRepository(this.companyWebService);

  Future<List<Company>> fetchCompanies() async {
    return await companyWebService.fetchCompanies();
  }
}
