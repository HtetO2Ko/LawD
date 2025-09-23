import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:law_diary/core/configs/theme/app_colors.dart';
import 'package:law_diary/core/utils/app_navigation_utils.dart';
import 'package:law_diary/features/auth/domain/entities/auth_entities.dart';
import 'package:law_diary/features/diary/presentation/diary_list_page.dart';
import 'package:law_diary/features/drawer/presentation/bloc/drawer_cubit.dart';
import 'package:law_diary/features/drawer/presentation/bloc/drawer_state.dart';
import 'package:law_diary/global.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrawerCubit, DrawerState>(
      builder: (context, state) {
        if (state is DrawerChanges) {
          return SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FutureBuilder<Widget>(
                  future: _accWidget(context),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return snapshot.data ?? Container();
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
                Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width,
                  color: AppColors.background,
                  margin: EdgeInsets.only(bottom: 20, top: 15),
                ),
                _drawWidget(
                  onTap: () {
                    advancedDrawerController.hideDrawer();
                    AppNavigator.pushReplacement(context, DiaryListPage());
                  },
                  icon: Icons.home,
                  txt: 'diaries',
                ),
                _drawWidget(
                  onTap: () {
                    advancedDrawerController.hideDrawer();
                    // AppNavigator.pushReplacement(context, BookPage());
                  },
                  icon: Icons.menu_book,
                  txt: 'books',
                ),
                _drawWidget(onTap: () {}, icon: Icons.lock, txt: 'forgot-psw'),
                _langWidget(context, state),
                SizedBox(height: 10),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }

  Future<Widget> _accWidget(BuildContext context) async {
    UserEntity userData = await context.read<DrawerCubit>().getUserData();
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                userData.username,
                style: TextStyle(
                  fontSize: 20,
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  debugPrint("Edit button click");
                },
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: Icon(Icons.edit, color: AppColors.primary, size: 20),
                ),
              ),
            ],
          ),
          Text(
            "@hteto2ko",
            style: TextStyle(fontSize: 16, color: AppColors.primary),
          ),
        ],
      ),
    );
    // return UserAccountsDrawerHeader(
    //   accountName: Text(
    //     userData.firstName,
    //     style: TextStyle(fontSize: 16, color: AppColors.primary),
    //   ),
    //   accountEmail: Text(
    //     userData.username,
    //     style: TextStyle(fontSize: 13, color: AppColors.primary),
    //   ),
    //   currentAccountPicture: GestureDetector(
    //     onTap: () {},
    //     child: CircleAvatar(
    //       child: ClipOval(
    //         child: Text(
    //           userData.firstName == ""
    //               ? ""
    //               : userData.firstName.toString().substring(0, 1).toUpperCase(),
    //           style: TextStyle(fontSize: 20, color: AppColors.primary),
    //         ),
    //       ),
    //     ),
    //   ),
    //   decoration: BoxDecoration(color: AppColors.drawerBackground),
    // );
  }

  Widget _drawWidget({
    required void Function() onTap,
    required IconData icon,
    required String txt,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 15, top: 10, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(icon, color: AppColors.primary, size: 23),
            SizedBox(width: 15),
            Text(
              txt.tr(),
              style: TextStyle(fontSize: 15, color: AppColors.primary),
            ),
          ],
        ),
      ),
    );
  }

  Widget _langWidget(BuildContext context, DrawerChanges state) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
      height: 40,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.primary)),
      ),
      child: DropdownButton(
        isDense: true,
        isExpanded: true,
        iconSize: 30,
        value: state.currentLang,
        items: const [
          DropdownMenuItem(value: "en", child: Text("English")),
          DropdownMenuItem(value: "my", child: Text("Myanmar")),
        ],
        onChanged: (String? value) {
          if (value != null) {
            context.read<DrawerCubit>().changeLanguage(value, context);
          }
        },
      ),
    );
  }
}
