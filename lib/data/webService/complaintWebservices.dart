import 'package:devloper_app/data/models/complaint.dart';
import 'package:dio/dio.dart';


class ComplaintWebService {
  final Dio _dio;

  ComplaintWebService({required String accessToken})
      : _dio = Dio(
          BaseOptions(
            baseUrl: 'http://localhost:8000/auth',
             receiveDataWhenStatusError: true,
          connectTimeout: const Duration(seconds: 60),
          receiveTimeout: const Duration(seconds: 60),
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $accessToken',
            },
          ),
        );

  Future<void> postComplaint(Complaint complaint) async {
    final response = await _dio.post(
      '/complaints/',
      data: complaint.toJson(),
    );
    if (response.statusCode! < 200 || response.statusCode! >= 300) {
      throw Exception('Failed to submit complaint');
    }
  }
}