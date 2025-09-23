import 'package:dartz/dartz.dart';
import 'package:law_diary/core/di/service_locator.dart';
import 'package:law_diary/core/usecase/usecase.dart';
import 'package:law_diary/features/diary/data/models/get_diary_list_params.dart';
import 'package:law_diary/features/diary/domain/repositories/diary_repo.dart';

class DiaryListUsecase extends UseCase<Either, DiaryListReqParams> {
  @override
  Future<Either> call({DiaryListReqParams? params}) async {
    return await sl<DiaryRepository>().getDiaryList(params!);
  }
}
