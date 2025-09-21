import 'package:dio/dio.dart';
import 'package:law_diary/core/constants/api_url.dart';
import 'package:law_diary/core/di/service_locator.dart';
import 'package:law_diary/core/network/dio_client.dart';
import 'package:law_diary/features/auth/data/models/auth_models.dart';
import 'package:law_diary/features/auth/data/models/auth_req_params.dart';

abstract class AuthSource {
  Future<UserModel> login(LoginRequestModel request);
}

class AuthSourceImpl implements AuthSource {
  @override
  Future<UserModel> login(LoginRequestModel request) async {
    print("Request json${request.toJson()}");
    try {
      final response = await sl<DioClient>().post(
        ApiUrl.login,
        data: request.toJson(),
      );

      final data = response.data;

      print("response ${response.statusCode}");
      print("response data ${response.data}");

      // if (data["returncode"] == "300") {
      //   return UserModel.fromJson(data["data"]);
      // } else {
      //   throw Exception(data["message"]);
      // }
      return UserModel.fromJson(data['user']);
    } on DioException catch (e) {
      print("Error Response StatusCode >> ${e.response!.statusCode}");
      print("Error Response Data >> ${e.response!.data}");
      return e.response!.data['message'];
    } catch (e) {
      rethrow;
    }
  }
}
