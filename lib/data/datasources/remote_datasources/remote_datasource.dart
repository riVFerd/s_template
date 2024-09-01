import 'package:dio/dio.dart';
import 'package:s_template/common/errors/api_exception.dart';
import 'package:s_template/common/utils/logger.dart';
import 'package:s_template/data/datasources/session/session_source.dart';


/// Base class for all remote datasource
class RemoteDatasource {
  final Dio _dio;
  final SessionSource _session;

  RemoteDatasource(this._dio, this._session);

  /// [T] is return type from [onResponse] network request
  /// [request] is the network request function which it's return type is param for [onResponse]
  /// throws [ApiException] if something went wrong
  Future<T> networkRequest<T>({
    required Future<Response> Function(Dio dio) request,
    required T Function(dynamic res) onResponse,
    bool isAuth = false,
  }) async {
    try {
      if (isAuth) {
        await _applyAuthHeader();
      } else {
        _dio.options.headers.remove("Authorization");
      }
      final response = await request(_dio);

      if (response.statusCode! >= 200 || response.statusCode! < 300) {
        // Todo: handle response since it's depend on the API response
        // ex: some API response with status code 200 but contain error

        // check if response contain error
        if (response.data['error'] != null) {
          throw ApiException(response.data['error']);
        }

        return onResponse(response.data);
      } else {
        throw ApiException(response.statusMessage ?? 'Something went wrong');
      }
    } on DioException catch (e) {
      logger.e(e);

      // Todo: handle other DioException
      // remove auth when status code is 401
      if (e.response?.statusCode == 401) {
        await _session.deleteToken();
        _dio.options.headers.remove("Authorization");
        throw ApiException('Unauthorized, please login again');
      }

      throw ApiException(e.message ?? 'Something went wrong');
    } catch (e) {
      logger.e(e);
      throw ApiException(e.toString());
    }
  }

  Future<void> _applyAuthHeader() async {
    final token = await _session.token;
    if (token != null) {
      _dio.options.headers.addAll({"Authorization": "Bearer $token"});
    } else {
      _dio.options.headers.remove("Authorization");
    }
  }
}
