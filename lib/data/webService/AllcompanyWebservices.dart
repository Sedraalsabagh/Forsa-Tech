import 'package:dio/dio.dart';
import 'package:devloper_app/data/models/All_company.dart';

class AllCompanyWebService {
  final Dio dio;

  AllCompanyWebService()
      : dio = Dio(BaseOptions(
          baseUrl: 'http://localhost:8000/admin-dash/',
          receiveDataWhenStatusError: true,
          connectTimeout: const Duration(seconds: 60),
          receiveTimeout: const Duration(seconds: 60),
        ));

  Future<List<AllCompany>> fetchAllCompanies() async {
    try {
      final response = await dio.get('companies/');
      if (response.statusCode == 200) {
        final List companiesJson = response.data['data']; // استخدام data
        return companiesJson.map((json) => AllCompany.fromJson(json)).toList();
      } else {
        throw Exception('فشل في تحميل الشركات');
      }
    } catch (e) {
      throw Exception('حدث خطأ أثناء جلب الشركات: $e');
    }
  }
}
