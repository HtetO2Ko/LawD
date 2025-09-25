import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:law_diary/features/diary/domain/entities/diary_list_entities.dart';
import 'package:law_diary/features/diary/presentation/bloc/entry/diary_entry_state.dart';

class DiaryEntryCubit extends Cubit<DiaryEntryState> {
  DiaryEntryCubit() : super(DiaryEntryInitial());

  bool _isEditing = false;
  DiaryListEntity? _editDiaryData;

  // form
  DateTime? _preDate = DateTime.now();
  final TextEditingController _caseNoCtr = TextEditingController();
  final TextEditingController _caseTypeCtr = TextEditingController();
  final TextEditingController _clientCtr = TextEditingController();
  Map<String, dynamic> _preaction = {};
  Map<String, dynamic> _todo = {};
  Map<String, dynamic> _action = {};
  Map<String, dynamic> _caseDocFile = {};
  DateTime? _nextDate = DateTime.now();

  bool get isEditing => _isEditing;
  DiaryListEntity? get editDiaryData => _editDiaryData;
  TextEditingController get caseNoCtr => _caseNoCtr;
  TextEditingController get caseTypeCtr => _caseTypeCtr;
  TextEditingController get clientCtr => _clientCtr;
  Map<String, dynamic> get preaction => _preaction;
  Map<String, dynamic> get todo => _todo;
  Map<String, dynamic> get action => _action;
  Map<String, dynamic> get caseDocFile => _caseDocFile;

  // form
  DateTime? get preDate => _preDate;
  DateTime? get nextDate => _nextDate;

  void init(DiaryListEntity? diaryData) {
    if (diaryData != null) {
      _isEditing = true;
      _editDiaryData = diaryData;
    }
  }
}
