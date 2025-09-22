import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:law_diary/core/configs/assets/app_images.dart';
import 'package:law_diary/core/configs/theme/app_colors.dart';
import 'package:law_diary/core/utils/app_navigation_utils.dart';
import 'package:law_diary/core/utils/button_utils.dart';
import 'package:law_diary/core/utils/toast_message_utils.dart';
import 'package:law_diary/features/auth/presentation/bloc/login_cubit.dart';
import 'package:law_diary/features/auth/presentation/bloc/login_state.dart';
import 'package:law_diary/features/diary/presentation/diary_list_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            AppNavigator.push(context, DiaryListPage());
          }

          if (state is LoginError) {
            ToastMessage.showSnackBar(state.message, false);
          }
        },
        builder: (context, state) {
          return GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Scaffold(
              body: SafeArea(
                minimum: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        _logoImage(),
                        _spacing(),
                        _usernameTextField(context),
                        _spacing(),
                        _passwordTextField(context),
                        _spacing(),
                        _loginBtn(context),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _spacing() {
    return SizedBox(height: 15);
  }

  Widget _logoImage() {
    return Center(
      child: Image.asset(AppImages.splashImg, width: 100, height: 100),
    );
  }

  Widget _usernameTextField(BuildContext context) {
    return TextField(
      controller: context.read<LoginCubit>().usernameCtr,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        label: Text("username".tr(), style: TextStyle(color: Colors.black54)),
      ),
    );
  }

  Widget _passwordTextField(BuildContext context) {
    return TextField(
      controller: context.read<LoginCubit>().passwordCtr,
      obscureText: context.read<LoginCubit>().isVisibility!,
      decoration: InputDecoration(
        label: Text("psw".tr()),
        suffix: GestureDetector(
          onTap: () => context.read<LoginCubit>().changeVisibility(),
          child: Icon(
            context.watch<LoginCubit>().isVisibility!
                ? Icons.visibility
                : Icons.visibility_off,
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }

  Widget _loginBtn(BuildContext context) {
    return CustomButton(
      btnTxt: "login",
      isLoading: context.read<LoginCubit>().isLoading,
      onTap: context.read<LoginCubit>().login,
    );
  }
}
