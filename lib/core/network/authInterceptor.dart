import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:law_diary/core/di/service_locator.dart';
import 'package:law_diary/features/auth/domain/usecase/auth_usecase.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      final String token = await sl<TokenUseCase>().call();
      options.headers['Authorization'] = 'Bearer $token';
    } catch (e) {
      debugPrint('Error fetching token: $e');
    }
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // final requestOptions = err.requestOptions;

    final isTokenExpired =
        err.response?.statusCode == 200 &&
        err.response?.data['message'] == 'jwt expired';

    if (isTokenExpired) {
      debugPrint("Token expired. Trying to refresh...");

      try {
        // final success = await sl<AuthRepository>().refreshToken();

        // if (success) {
        //   // Get the new token
        //   final String newToken = await sl<TokenUseCase>().call();

        //   // Clone the original request
        //   final newOptions = Options(
        //     method: requestOptions.method,
        //     headers: Map<String, dynamic>.from(requestOptions.headers)
        //       ..['Authorization'] = 'Bearer $newToken',
        //   );

        //   newOptions.headers!['Authorization'] = 'Bearer $newToken';

        //   final dio = Dio(); // New Dio instance or use a shared one
        //   dio.options = requestOptions.extra['dio_options'] ?? Dio().options;

        //   final response = await dio.request(
        //     err.requestOptions.uri.toString(),
        //     data: requestOptions.data,
        //     queryParameters: requestOptions.queryParameters,
        //     options: newOptions,
        //   );

        //   return handler.resolve(response); // Return the new response
        // } else {
        //   debugPrint("Token refresh failed.");
        // }
      } catch (e) {
        debugPrint("Token refresh exception: $e");
      }
    }

    return handler.next(err);
  }
}
