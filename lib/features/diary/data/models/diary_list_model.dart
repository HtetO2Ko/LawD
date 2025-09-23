import 'package:law_diary/features/diary/domain/entities/diary_list_entities.dart';

class DiaryListModel extends DiaryListEntity {
  const DiaryListModel({
    required super.diaryid,
    required super.userid,
    required super.previousdate,
    required super.causenum,
    required super.casetype,
    required super.clientname,
    required super.todo,
    required super.action,
    required super.casedocfile,
    required super.appointment,
    required super.status,
  });

  factory DiaryListModel.fromJson(Map<String, dynamic> json) {
    return DiaryListModel(
      diaryid: json["diaryid"],
      userid: json["userid"],
      previousdate: DateTime.tryParse(json["previousdate"] ?? ""),
      causenum: json["causenum"],
      casetype: json["casetype"],
      clientname: json["clientname"],
      todo: json["todo"] ?? {},
      action: json["action"] ?? {},
      casedocfile: json["casedocfile"] ?? {},
      appointment: DateTime.tryParse(json["appointment"] ?? ""),
      status: json['status'] ?? 1,
    );
  }
}
