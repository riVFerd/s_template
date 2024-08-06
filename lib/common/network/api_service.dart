import 'package:dio/dio.dart';

class ApiService {
  // Todo: configure all the necessary settings for the Dio instance
  static Dio dio() {
    final dio = Dio(
      BaseOptions(
        // baseUrl: '',
        sendTimeout: const Duration(minutes: 3),
        connectTimeout: const Duration(minutes: 3),
        receiveTimeout: const Duration(minutes: 3),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
      ),
    );
    return dio;
  }
}