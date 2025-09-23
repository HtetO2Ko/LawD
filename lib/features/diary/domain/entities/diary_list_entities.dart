import 'package:equatable/equatable.dart';

class DiaryListEntity extends Equatable {
  final String? diaryid;
  final String? userid;
  final DateTime? previousdate;
  final String? causenum;
  final String? casetype;
  final String? clientname;
  final Map<String, dynamic> todo;
  final Map<String, dynamic> action;
  final Map<String, dynamic> casedocfile;
  final DateTime? appointment;
  final int? status;
  const DiaryListEntity({
    required this.diaryid,
    required this.userid,
    required this.previousdate,
    required this.causenum,
    required this.casetype,
    required this.clientname,
    required this.todo,
    required this.action,
    required this.casedocfile,
    required this.appointment,
    required this.status,
  });

  @override
  List<Object?> get props => [
    diaryid,
    userid,
    previousdate,
    causenum,
    casetype,
    clientname,
    todo,
    action,
    casedocfile,
    appointment,
    status,
  ];
}
