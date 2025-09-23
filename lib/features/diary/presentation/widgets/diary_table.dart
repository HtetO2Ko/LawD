import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:law_diary/core/configs/theme/app_colors.dart';
import 'package:law_diary/core/constants/table_type.dart';
import 'package:law_diary/core/utils/table/table_body_utils.dart';
import 'package:law_diary/core/utils/table/table_header_utils.dart';
import 'package:law_diary/features/diary/domain/entities/diary_list_entities.dart';

class DiaryTable extends StatelessWidget {
  final List<DiaryListEntity> diaryList;
  const DiaryTable({super.key, required this.diaryList});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
          child: Column(
            children: [
              TableHeaderUtils(type: TableType.diary),
              if (diaryList.isEmpty)
                Container(
                  color: AppColors.tableBody,
                  height: 400,
                  width: 1450,
                  child: Center(
                    child: Text(
                      "no-data".tr(),
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 23,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),

              if (diaryList.isNotEmpty)
                DiaryTableBody(
                  diaryList: diaryList,
                  type: TableType.diary,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
