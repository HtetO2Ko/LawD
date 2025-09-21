import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:law_diary/core/di/service_locator.dart';
import 'package:law_diary/features/auth/data/models/auth_req_params.dart';
import 'package:law_diary/features/auth/domain/usecase.dart/auth_usecase.dart';
import 'package:law_diary/features/auth/presentation/bloc/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final TextEditingController _usernameCtr = TextEditingController();
  TextEditingController? get usernameCtr => _usernameCtr;
  final TextEditingController _passwordCtr = TextEditingController();
  TextEditingController? get passwordCtr => _passwordCtr;

  bool? _isVisibility = true;
  bool? get isVisibility => _isVisibility;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void changeVisibility() {
    _isVisibility = !_isVisibility!;
    emit(ChangeVisibility());
  }

  Future<void> login() async {
    // check null and blank

    // loading
    _isLoading = true;
    emit(LoginLoading());

    // api calling
    try {
      print("UserName ${_usernameCtr.text}");
      print("UserName ${_passwordCtr.text}");
      final returnedData = await sl<LoginUseCase>().call(
        params: LoginRequestModel(
          username: _usernameCtr.text,
          password: _passwordCtr.text,
        ),
      );
      print("Return Data:>>> $returnedData");
    } catch (e) {
      print("Error >> $e");
    }
  }
}
