import 'package:dio/dio.dart';

class HomePageService {
  late Response _response;
  static final HomePageService _service = HomePageService();
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://demo.zinipay.com',
    ),
  );

  static HomePageService getInstance() {
    return _service;
  }

  Future<Response> fetchData() async {
    _dio.options.connectTimeout = const Duration(seconds: 5);
    _dio.options.receiveTimeout = const Duration(seconds: 3);

    try {
      _response = await _dio.get('/sms/');
      return _response;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {

        return fetchData();
      } else {
        rethrow;
      }
    }
  }
}