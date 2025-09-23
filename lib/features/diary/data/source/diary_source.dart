import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:law_diary/core/constants/api_url.dart';
import 'package:law_diary/core/di/service_locator.dart';
import 'package:law_diary/core/network/dio_client.dart';
import 'package:law_diary/features/diary/data/models/diary_list_model.dart';
import 'package:law_diary/features/diary/data/models/get_diary_list_params.dart';

abstract class DiarySource {
  Future<Either> getDiaryList(DiaryListReqParams request);
}

class DiarySourceImpl implements DiarySource {
  @override
  Future<Either> getDiaryList(DiaryListReqParams request) async {
    try {
      final response = await sl<DioClient>().post(
        ApiUrl.getdiarylist,
        data: request.toJson(),
      );

      final data = response.data;

      //
      if (data['status'] == "success") {
        List<DiaryListModel> diaryList = List.from(
          data['data'],
        ).map((item) => DiaryListModel.fromJson(item)).toList();
        return Right(diaryList);
      }
      return Left(response.statusCode.toString());
    } on DioException catch (e) {
      return Left(e.response!.data['message'] ?? "");
    } catch (e) {
      return Left(e.toString());
    }
  }
}
