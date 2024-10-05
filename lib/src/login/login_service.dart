import 'package:dio/dio.dart';

class LoginService {
  static final LoginService _service = LoginService();
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://demo.zinipay.com',
    ),
  );

  static LoginService getInstance() {
    return _service;
  }

  Future<String> login(String email, String apiKey) async {
    try {
      String msg = '';
      final response = await _dio.post('/app/auth/', data: {
        'email': email,
        'apiKey': apiKey,
      });
      if (response.data is Map<String, dynamic>) {
        final responseData = response.data as Map<String, dynamic>;
        if (responseData.containsKey('message')) {
          msg = responseData['message'] as String;
        }
      }
      return msg;
    } on DioException catch (e) {
      if (e.response?.data != null) {
        final responseData = e.response?.data as Map<String, dynamic>;
        return responseData['message'] as String;
      } else {
        return 'Error: DioException - No response data';
      }
    }
  }
}
