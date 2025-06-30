import 'package:adv_flutter_labs/import_export.dart';

class StuModel {
  int? _stuId;

  int? get stuId => _stuId;

  set stuId(int? value) {
    _stuId = value;
  }

  String? _stuName;

  String? get stuName => _stuName;

  set stuName(String? value) {
    _stuName = value;
  }

  StuModel({int? stuId, String? stuName}) : _stuName = stuName, _stuId = stuId;

  Map<String, Object?> toMap() {
    return {COL_STU_ID: stuId, COL_STU_NAME: stuName};
  }

  StuModel fromMap(Map<String, Object?> stuData) {
    return StuModel(
      stuId: stuData[COL_STU_ID] as int,
      stuName: stuData[COL_STU_NAME].toString(),
    );
  }
}
