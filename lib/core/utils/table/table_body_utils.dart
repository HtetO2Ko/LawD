import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:law_diary/core/configs/theme/app_colors.dart';
import 'package:law_diary/core/constants/table_type.dart';
import 'package:law_diary/core/utils/date_formatter.dart';
import 'package:law_diary/features/diary/domain/entities/diary_list_entities.dart';

class DiaryTableBody extends StatelessWidget {
  final List<DiaryListEntity> diaryList;
  final TableType type;

  const DiaryTableBody({
    super.key,
    required this.diaryList,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: diaryList
          .map((DiaryListEntity diary) => _buildDiaryRow(context, diary))
          .toList(),
    );
  }

  Widget _buildDiaryRow(BuildContext context, DiaryListEntity diary) {
    return GestureDetector(
      onTap: type == TableType.history
          ? null
          : () => _navigateToDiaryDetail(context, diary: diary),
      child: Row(children: _generateHeader(diary, context)),
    );
  }

  List<Widget> _generateHeader(DiaryListEntity diary, BuildContext context) {
    final previousDate = _formatDate(diary.previousdate);
    final appointmentDate = _formatDate(diary.appointment);
    switch (type) {
      case TableType.history:
        return [
          // _buildBodyCell(text: previousDate),
          // _buildActionCell(
          //   text: diary.action['title'],
          //   onTap: () => context.read<DiaryHistoryCubit>().gotoNote(
          //     context,
          //     editNote: diary.action,
          //   ),
          // ),
          // _buildBodyCell(text: appointmentDate, width: 250),
          // _buildActionCell(
          //   text: diary.todo['title'],
          //   onTap: () => context.read<DiaryHistoryCubit>().gotoNote(
          //     context,
          //     editNote: diary.todo,
          //   ),
          // ),
        ];
      case TableType.diary:
        return [
          _buildBodyCell(text: diary.causenum.toString()),
          _buildBodyCell(text: diary.casetype.toString()),
          _buildBodyCell(text: diary.clientname.toString()),
          _buildBodyCell(text: previousDate),
          _buildActionCell(
            text: diary.action['title'],
            // Go to note
            // onTap: () => context.read<DiaryListCubit>().gotoNote(
            //   context,
            //   editNote: diary.action,
            // ),
          ),
          _buildActionCell(
            text: diary.todo['title'],
            // Go to note
            // onTap: () => context.read<DiaryListCubit>().gotoNote(
            //   context,
            //   editNote: diary.action,
            // ),
          ),
          _buildBodyCell(text: appointmentDate, width: 250),
        ];
    }
  }

  String _formatDate(DateTime? date) {
    return date == null ? "" : DateFormatter.formatDDMMYYYY(date);
  }

  void _navigateToDiaryDetail(
    BuildContext context, {
    required DiaryListEntity diary,
  }) {
    // Go To Details
    // AppNavigator.push(context, DiaryDetail(diary: diary));
  }

  Widget _buildBodyCell({
    required String text,
    BoxBorder? border,
    double width = 200,
  }) {
    return Container(
      height: 70,
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.tableBody,
        border: border ?? Border.all(color: AppColors.tableBorder),
      ),
      child: _buildTextWidget(text: text),
    );
  }

  Widget _buildActionCell({required String text, VoidCallback? onTap}) {
    return Container(
      height: 70,
      width: 200,
      decoration: BoxDecoration(
        color: AppColors.tableBody,
        border: Border.all(color: AppColors.tableBorder),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: GestureDetector(
        onTap: onTap,
        child: Center(
          child: Container(
            height: 40,
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.folderBackground,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                const Icon(Icons.folder, size: 18, color: AppColors.primary),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    text,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12, color: AppColors.primary),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextWidget({required String text}) {
    return Align(
      alignment: Alignment.centerLeft,
      child: AutoSizeText(
        text,
        maxFontSize: 12,
        minFontSize: 8,
        textAlign: TextAlign.start,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 12, color: AppColors.primary),
      ),
    );
  }
}
