import 'package:dartz/dartz.dart';
import 'package:law_diary/core/di/service_locator.dart';
import 'package:law_diary/features/diary/data/models/get_diary_list_params.dart';
import 'package:law_diary/features/diary/data/source/diary_source.dart';
import 'package:law_diary/features/diary/domain/repositories/diary_repo.dart';

class DiaryRepoImpl extends DiaryRepository {
  @override
  Future<Either> getDiaryList(DiaryListReqParams request) async {
    var data = await sl<DiarySource>().getDiaryList(request);
    return data;
  }
}
