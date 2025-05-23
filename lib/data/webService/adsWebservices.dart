import 'package:devloper_app/data/models/company_ads.dart';
import 'package:dio/dio.dart';

class CompanyWebService {
  final Dio dio;

  CompanyWebService()
      : dio = Dio(BaseOptions(
          baseUrl: 'http://localhost:8000/admin-dash/ads/',
          receiveDataWhenStatusError: true,
          connectTimeout: const Duration(seconds: 60),
          receiveTimeout: const Duration(seconds: 60),
        ));

  Future<List<Company>> fetchCompanies() async {
    try {
      Response response = await dio.get('');
      if (response.statusCode == 200) {
        var data = response.data;
        if (data is Map<String, dynamic> && data['data'] is List) {
          return (data['data'] as List)
              .map((json) => Company.fromJson(json as Map<String, dynamic>))
              .toList();
        } else {
          throw Exception('Unexpected response format: ${data.runtimeType}');
        }
      } else {
        throw Exception('Failed to load companies: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching companies: $e');
    }
  }
}
