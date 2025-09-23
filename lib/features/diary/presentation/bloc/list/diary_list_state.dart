import 'package:law_diary/features/diary/domain/entities/diary_list_entities.dart';

abstract class DiaryListState {}

class DiaryListLoading extends DiaryListState {}

class DiaryListLoaded extends DiaryListState {
  final List<DiaryListEntity> diaryList;
  DiaryListLoaded({required this.diaryList});
}

class FailureLoadDiaryList extends DiaryListState {
  final String errorMessage;
  FailureLoadDiaryList({required this.errorMessage});
}
