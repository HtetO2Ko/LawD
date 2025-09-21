import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:law_diary/core/configs/theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String btnTxt;
  final void Function()? onTap;
  const CustomButton({super.key, required this.btnTxt, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      highlightColor: AppColors.highlightColor,
      splashColor: AppColors.splashColor,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.btnColor,
        ),
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Text(
            btnTxt.tr(),
            style: TextStyle(color: AppColors.primary, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
