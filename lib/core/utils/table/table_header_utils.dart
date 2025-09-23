import 'package:flutter/material.dart';
import 'package:law_diary/core/constants/table_type.dart';
import 'package:law_diary/core/utils/table/generic_table_header.dart';

class TableHeaderUtils extends StatelessWidget {
  final TableType type;

  const TableHeaderUtils({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return GenericTableHeader(headers: _getHeaders(type));
  }

  List<HeaderConfig> _getHeaders(TableType type) {
    switch (type) {
      case TableType.diary:
        return [
          HeaderConfig(
            txt: 'case-no',
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10)),
          ),
          HeaderConfig(txt: 'case-type'),
          HeaderConfig(txt: 'client'),
          HeaderConfig(txt: 'pre-date'),
          HeaderConfig(txt: 'todo'),
          HeaderConfig(txt: 'action'),
          HeaderConfig(
            txt: "appointment-date",
            borderRadius: BorderRadius.only(topRight: Radius.circular(10)),
            width: 250,
          ),
        ];
      case TableType.history:
        return [
          HeaderConfig(
            txt: 'pre-date',
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10)),
          ),
          HeaderConfig(
            txt: 'todo',
            borderRadius: BorderRadius.only(topRight: Radius.circular(10)),
          ),
          HeaderConfig(txt: "appointment-date", width: 250),
          HeaderConfig(txt: 'action'),
        ];
    }
  }
}
