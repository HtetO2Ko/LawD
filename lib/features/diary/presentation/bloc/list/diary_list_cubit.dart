import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:law_diary/core/di/service_locator.dart';
import 'package:law_diary/features/auth/domain/entities/auth_entities.dart';
import 'package:law_diary/features/auth/domain/usecase/auth_usecase.dart';
import 'package:law_diary/features/diary/data/models/get_diary_list_params.dart';
import 'package:law_diary/features/diary/domain/usecase/diary_usecase.dart';
import 'package:law_diary/features/diary/presentation/bloc/list/diary_list_state.dart';

class DiaryListCubit extends Cubit<DiaryListState> {
  DiaryListCubit() : super(DiaryListLoading());

  getDiaryList() async {
    // await Future.delayed(Duration(seconds: 3));
    // emit(DiaryListLoaded(diaryList: []));
    final UserEntity userData = await sl<LoginUserUseCase>().call();
    var returnedData = await sl<DiaryListUsecase>().call(
      params: DiaryListReqParams(
        userid: userData.userId,
        // appointment: DateFormatter.formatYYYYMMDD(_selectedDate!),
        appointment: "2025-06-30",
      ),
    );
    returnedData.fold(
      (error) {
        emit(FailureLoadDiaryList(errorMessage: error));
      },
      (data) {
        emit(DiaryListLoaded(diaryList: data));
      },
    );
  }
}
