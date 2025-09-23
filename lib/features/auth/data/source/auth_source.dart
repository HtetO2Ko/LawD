import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:law_diary/core/constants/api_url.dart';
import 'package:law_diary/core/di/service_locator.dart';
import 'package:law_diary/core/network/dio_client.dart';
import 'package:law_diary/core/utils/storage/storage_utils.dart';
import 'package:law_diary/features/auth/data/models/auth_models.dart';
import 'package:law_diary/features/auth/data/models/auth_req_params.dart';
import 'package:law_diary/core/constants/storage_keys.dart';
import 'package:law_diary/core/utils/storage/secure_storage_utils.dart';

abstract class AuthSource {
  Future<Either> login(LoginRequestModel request);
}

class AuthSourceImpl implements AuthSource {
  @override
  Future<Either> login(LoginRequestModel request) async {
    try {
      final response = await sl<DioClient>().post(
        ApiUrl.login,
        data: request.toJson(),
      );

      final data = response.data;

      if (data['status'] == "success") {
        await SecureStorageUtils.putString(
          StorageKeys.token,
          data["token"].toString(),
        );
        StorageUtils.putString(
          StorageKeys.userData,
          jsonEncode(data['user'] ?? {}),
        );
        return Right(UserModel.fromJson(data['user']));
      }

      // for new
      // if (response.statusCode == 200) {
      //   final data = response.data;
      //   if (data['returncode'] == "300") {
      //     // save token
      //     await SecureStorageUtils.putString(
      //       StorageKeys.token,
      //       data["token"].toString(),
      //     );
      //     return Right(UserModel.fromJson(data['user']));
      //   } else if (data['returncode'] == "200") {
      //     return Left(data["message"]);
      //   }
      // }
      return Left(response.statusCode.toString());
    } on DioException catch (e) {
      return Left(e.response!.data['message'] ?? "");
    } catch (e) {
      return Left(e.toString());
    }
  }
}
