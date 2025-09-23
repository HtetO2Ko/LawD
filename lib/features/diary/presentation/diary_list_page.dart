import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:law_diary/core/utils/appbar_utils.dart';
import 'package:law_diary/core/utils/display_error.dart';
import 'package:law_diary/core/utils/drawer_utils.dart';
import 'package:law_diary/core/utils/loading_utils.dart';
import 'package:law_diary/features/diary/presentation/bloc/list/diary_list_cubit.dart';
import 'package:law_diary/features/diary/presentation/bloc/list/diary_list_state.dart';
import 'package:law_diary/features/diary/presentation/widgets/diary_table.dart';
import 'package:law_diary/features/drawer/presentation/bloc/drawer_cubit.dart';
import 'package:law_diary/features/drawer/presentation/bloc/drawer_state.dart';
import 'package:law_diary/global.dart';

class DiaryListPage extends StatelessWidget {
  const DiaryListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DiaryListCubit()..getDiaryList(),
      child: BlocBuilder<DrawerCubit, DrawerState>(
        builder: (context, drawerState) {
          return DrawerUtils(
            child: Scaffold(
              appBar: AppbarUtils(
                title: Text("diaries".tr()),
                hideBack: true,
                leading: InkWell(
                  onTap: handleMenuButtonPressed,
                  child: ValueListenableBuilder<AdvancedDrawerValue>(
                    valueListenable: advancedDrawerController,
                    builder: (_, value, __) {
                      return AnimatedSwitcher(
                        duration: Duration(milliseconds: 250),
                        child: Icon(
                          value.visible ? Icons.clear : Icons.menu,
                          key: ValueKey<bool>(value.visible),
                        ),
                      );
                    },
                  ),
                ),
                height: 60,
              ),

              body: BlocBuilder<DiaryListCubit, DiaryListState>(
                builder: (context, state) {
                  if (state is DiaryListLoading) {
                    return Loading();
                  }

                  if (state is DiaryListLoaded) {
                    return DiaryTable(diaryList: state.diaryList);
                  }

                  if (state is FailureLoadDiaryList) {
                    return DisplayError(errorMessage: state.errorMessage);
                  }

                  return Container();
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
