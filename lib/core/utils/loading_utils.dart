import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:law_diary/core/configs/theme/app_colors.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitRing(color: AppColors.primary, size: 50, lineWidth: 5),
    );
  }
}

class LoadingForButton extends StatelessWidget {
  const LoadingForButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SpinKitRing(color: AppColors.primary, size: 20, lineWidth: 2);
  }
}
