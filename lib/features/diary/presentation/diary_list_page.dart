import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:law_diary/core/utils/appbar_utils.dart';
import 'package:law_diary/core/utils/drawer_utils.dart';
import 'package:law_diary/features/drawer/presentation/bloc/drawer_cubit.dart';
import 'package:law_diary/features/drawer/presentation/bloc/drawer_state.dart';
import 'package:law_diary/global.dart';

class DiaryListPage extends StatelessWidget {
  const DiaryListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrawerCubit, DrawerState>(
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
          ),
        );
      },
    );
  }
}
