import 'package:dio/dio.dart';
import 'package:dio_brotli_transformer/dio_brotli_transformer.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:wallet_app/apiBase.dart';

class DioFactory {
  DioFactory({this.baseUrl = apiBase});

  final _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
  );

  final String baseUrl;

  Future<String?> getAuthToken() async {
    return await _storage.read(key: 'authToken');
  }

  Dio create() {
    final dio = Dio(_createBaseOptions());

    dio.options.contentType = Headers.jsonContentType;
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final authToken = await getAuthToken();
          if (authToken != null) {
            options.headers['Authorization'] = 'Bearer $authToken';
            Logger().i("Auth token added to request: $authToken");
          }
          return handler.next(options);
        },
        onError: (DioError error, handler) async {
          if (error.response?.statusCode == 401) {
            Logger().e("Unauthorized request");
          }
          return handler.next(error);
        },
      ),
    );

    dio.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        compact: false,
      ),
    );

    dio.interceptors.add(
      RetryInterceptor(
        dio: dio,
        logPrint: print,
        retries: 1,
        retryDelays: const [
          Duration.zero,
        ],
      ),
    );

    dio.transformer = DioBrotliTransformer();

    return dio;
  }

  BaseOptions _createBaseOptions() => BaseOptions(
        baseUrl: baseUrl,
        receiveTimeout: const Duration(milliseconds: 15000),
        sendTimeout: const Duration(milliseconds: 15000),
        connectTimeout: const Duration(milliseconds: 15000),
        headers: {'accept-encoding': 'br'},
      );
}
