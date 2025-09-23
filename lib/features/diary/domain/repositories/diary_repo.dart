import 'package:dartz/dartz.dart';
import 'package:law_diary/features/diary/data/models/get_diary_list_params.dart';

abstract class DiaryRepository {
  Future<Either> getDiaryList(DiaryListReqParams request);
}
