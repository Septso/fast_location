import 'package:dio/dio.dart';

class DioClient {
  final Dio dio;

  DioClient({Dio? dioClient})
      : dio = dioClient ??
            Dio(BaseOptions(
              baseUrl: 'https://viacep.com.br/ws/',
              connectTimeout: const Duration(seconds: 8),
              receiveTimeout: const Duration(seconds: 8),
            ));

  Future<Response> getCep(String cep) async {
    final sanitized = cep.replaceAll(RegExp(r'[^0-9]'), '');
    final url = '$sanitized/json/';
    return dio.get(url);
  }
}
