import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:law_diary/core/configs/theme/app_colors.dart';

class GenericTableHeader extends StatelessWidget {
  final List<HeaderConfig> headers;

  const GenericTableHeader({super.key, required this.headers});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: headers.map((header) {
        return _header(
          txt: header.txt,
          borderRadius: header.borderRadius,
          width: header.width,
        );
      }).toList(),
    );
  }

  Widget _header({
    required String txt,
    BoxBorder? border,
    BorderRadiusGeometry? borderRadius,
    double width = 200,
  }) {
    return Container(
      height: 50,
      padding: const EdgeInsets.only(left: 20, right: 20),
      width: width,
      decoration: BoxDecoration(
        color: AppColors.tableHeader,
        borderRadius: borderRadius,
        border: border ?? Border.all(color: AppColors.tableBorder),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          txt.tr(),
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 18,
            color: AppColors.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class HeaderConfig {
  final String txt;
  final BorderRadiusGeometry? borderRadius;
  final double width;

  HeaderConfig({required this.txt, this.borderRadius, this.width = 200});
}
