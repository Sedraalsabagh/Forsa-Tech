import 'package:devloper_app/data/models/opportunity.dart';
import 'package:dio/dio.dart';
import 'package:devloper_app/constants/String.dart';

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
        'opportunities/',
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
}
