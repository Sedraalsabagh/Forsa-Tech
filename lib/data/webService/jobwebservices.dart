import 'package:devloper_app/data/models/opportunity.dart';
import 'package:dio/dio.dart';
import 'package:devloper_app/constants/String.dart';
import 'package:devloper_app/data/models/oportunity.dart';

class WebServicesJobCard {
  final Dio dio;

  WebServicesJobCard()
      : dio = Dio(BaseOptions(
          baseUrl: baseUrl,
          receiveDataWhenStatusError: true,
          connectTimeout: Duration(seconds: 60),
          receiveTimeout: Duration(seconds: 60),
        ));

  Future<List<JobCard>> getJobCards() async {
    try {
      Response response = await dio.get(
        'Forsa/',
        options: Options(
          headers: {
            'Accept': 'application/json',
          },
        ),
      );

      if (response.data is List) {
        return (response.data as List)
            .map((item) => JobCard.fromJson(item))
            .toList();
      } else {
        throw Exception('Invalid data format');
      }
    } on DioError catch (dioError) {
      print("DioError: ${dioError.message}");
      throw Exception('Failed to fetch job cards: ${dioError.message}');
    } catch (e) {
      print("Unexpected Error: $e");
      throw Exception('Unexpected error occurred');
    }
  }

  Future<Opportunity?> getOpportunityById(int id) async {
    try {
      Response response = await dio.get("opportunityById/$id/");

      print("Response data: ${response.data}");

      if (response.statusCode == 200 &&
          response.data != null &&
          response.data is Map<String, dynamic> &&
          response.data.containsKey('id')) {
        return Opportunity.fromJson(response.data);
      } else {
        print("Opportunity not found or invalid format");
        return null;
      }
    } catch (e) {
      print("Exception: $e");
      return null;
    }
  }
}
