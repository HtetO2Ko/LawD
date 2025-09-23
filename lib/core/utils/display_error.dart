import 'package:flutter/material.dart';
import 'package:law_diary/core/configs/theme/app_colors.dart';

class DisplayError extends StatelessWidget {
  final String errorMessage;
  const DisplayError({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessage,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          color: AppColors.primary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
