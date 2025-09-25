import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:law_diary/core/configs/theme/app_colors.dart';
import 'package:law_diary/core/constants/diary_data_type.dart';
import 'package:law_diary/core/utils/app_navigation_utils.dart';
import 'package:law_diary/core/utils/appbar_utils.dart';
import 'package:law_diary/core/utils/date_formatter.dart';
import 'package:law_diary/features/diary/domain/entities/diary_list_entities.dart';
import 'package:law_diary/features/diary/presentation/bloc/entry/diary_entry_cubit.dart';
import 'package:law_diary/features/diary/presentation/bloc/entry/diary_entry_state.dart';
import 'package:law_diary/global.dart';

class DiaryEntryPage extends StatelessWidget {
  final DiaryListEntity? diaryData;
  const DiaryEntryPage({super.key, this.diaryData});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          AppNavigator.pop(context);
        }
      },
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: BlocProvider(
          create: (context) => DiaryEntryCubit()..init(diaryData),
          child: BlocConsumer<DiaryEntryCubit, DiaryEntryState>(
            listener: (context, state) {},
            builder: (context, state) {
              final cubit = context.read<DiaryEntryCubit>();
              final bool isEditing = cubit.isEditing;
              final String appBarTitle = isEditing ? "edit-diary" : "add-diary";

              return Scaffold(
                appBar: AppbarUtils(
                  title: Text(appBarTitle.tr()),
                  hideBack: false,
                ),
                body: SingleChildScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _labelText("pre-date"),
                        _buildDatePicker(
                          context,
                          cubit: cubit,
                          date: DiaryDateType.previous,
                        ),
                        _spacing(),
                        _labelText("case-no"),
                        _buildTextField(controller: cubit.caseNoCtr),
                        _spacing(),
                        _buildRow(
                          leftWidget: _labelText("case-type"),
                          rightWidget: _labelText("client"),
                        ),
                        _buildRow(
                          leftWidget: _buildTextField(
                            controller: cubit.caseTypeCtr,
                          ),
                          rightWidget: _buildTextField(
                            controller: cubit.clientCtr,
                          ),
                        ),
                        _showPreAction(cubit),
                        _spacing(),
                        _buildRow(
                          leftWidget: _labelText("todo"),
                          rightWidget: _labelText("action"),
                        ),
                        _buildRow(
                          leftWidget: _buildFolder(
                            title: cubit.todo.isEmpty
                                ? "Title..."
                                : cubit.todo['title'],
                            onTap: () {},
                            // onTap: () => cubit.gotoNote(context, type: 1),
                          ),
                          rightWidget: _buildFolder(
                            title: cubit.action.isEmpty
                                ? "Title..."
                                : cubit.action['title'],
                            onTap: () {},
                            // onTap: () => cubit.gotoNote(context, type: 2),
                          ),
                        ),
                        _spacing(),
                        _labelText("case-doc-file"),
                        _buildFolder(
                          title: cubit.caseDocFile.isEmpty
                              ? "Title..."
                              : cubit.caseDocFile['title'],
                          onTap: () {},
                          // onTap: () => cubit.gotoNote(context, type: 3),
                        ),
                        _spacing(),
                        _labelText("appointment-date"),
                        _buildDatePicker(
                          context,
                          cubit: cubit,
                          date: DiaryDateType.next,
                        ),
                        _spacing(),
                        // diaryData == null ? Container() : _buildStatus(cubit),
                        SizedBox(height: 50),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _spacing() => SizedBox(height: 10);

  Widget _labelText(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Text(
        label.tr(),
        style: TextStyle(
          color: AppColors.primary,
          fontWeight: FontWeight.w400,
          fontSize: 13,
        ),
      ),
    );
  }

  Widget _buildDatePicker(
    BuildContext context, {
    required DiaryEntryCubit cubit,
    required DiaryDateType date,
  }) {
    return InkWell(
      // onTap: () => cubit.changeDate(context, date),
      child: Container(
        height: 60,
        width: screenWidth(context),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.primary),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              date == DiaryDateType.previous
                  ? (cubit.preDate != null
                        ? DateFormatter.formatDDMMYYYY(cubit.preDate!)
                        : "Previous Date")
                  : date == DiaryDateType.next
                  ? (cubit.nextDate != null
                        ? DateFormatter.formatDDMMYYYY(cubit.nextDate!)
                        : "Next Date")
                  : "Date",
              textAlign: TextAlign.left,
              style: const TextStyle(fontSize: 15, color: AppColors.primary),
            ),
            const Icon(
              Icons.arrow_drop_down_outlined,
              size: 23,
              color: AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      enabled: diaryData == null ? true : false,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  Widget _buildRow({required Widget leftWidget, required Widget rightWidget}) {
    return Row(
      children: [
        Expanded(child: leftWidget),
        SizedBox(width: 10),
        Expanded(child: rightWidget),
      ],
    );
  }

  Widget _showPreAction(DiaryEntryCubit cubit) {
    if (diaryData == null) {
      return Container();
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _spacing(),
          _labelText("pre-action"),
          _buildFolder(
            title: cubit.preaction.isEmpty
                ? "Title..."
                : cubit.preaction['title'],
            onTap: () {},
          ),
        ],
      );
    }
  }

  Widget _buildFolder({required String title, required void Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.folderBackground,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            const Icon(Icons.folder, size: 18, color: AppColors.primary),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                title == "" ? "TItle..." : title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12, color: AppColors.primary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
