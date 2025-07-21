import 'package:adv_flutter_labs/import_export.dart';

class StuModel {
  int? _stuId;
  String? _stuName;
  String? _enrollmentNo;
  String? _email;
  String? _phoneNumber;
  String? _branch;
  double? _cgpa;
  String? _grade12;

  // Getters
  int? get stuId => _stuId;
  String? get stuName => _stuName;
  String? get enrollmentNo => _enrollmentNo;
  String? get email => _email;
  String? get phoneNumber => _phoneNumber;
  String? get branch => _branch;
  double? get cgpa => _cgpa;
  String? get grade12 => _grade12;

  // Setters
  set stuId(int? value) => _stuId = value;
  set stuName(String? value) => _stuName = value;
  set enrollmentNo(String? value) => _enrollmentNo = value;
  set email(String? value) => _email = value;
  set phoneNumber(String? value) => _phoneNumber = value;
  set branch(String? value) => _branch = value;
  set cgpa(double? value) => _cgpa = value;
  set grade12(String? value) => _grade12 = value;

  // Constructor
  StuModel({
    int? stuId,
    String? stuName,
    String? enrollmentNo,
    String? email,
    String? phoneNumber,
    String? branch,
    double? cgpa,
    String? grade12,
  })  : _stuId = stuId,
        _stuName = stuName,
        _enrollmentNo = enrollmentNo,
        _email = email,
        _phoneNumber = phoneNumber,
        _branch = branch,
        _cgpa = cgpa,
        _grade12 = grade12;

  // Convert object to map
  Map<String, Object?> toMap() {
    return {
      COL_STU_ID: _stuId,
      COL_STU_NAME: _stuName,
      COL_ENROLLMENT_NO: _enrollmentNo,
      COL_EMAIL: _email,
      COL_PHONENUMBER: _phoneNumber,
      COL_BRANCH: _branch,
      COL_CGPA: _cgpa,
      COL_12TH_GRADE: _grade12,
    };
  }

  // Convert map to object
  factory StuModel.fromMap(Map<String, Object?> stuData) {
    return StuModel(
      stuId: stuData[COL_STU_ID] as int?,
      stuName: stuData[COL_STU_NAME]?.toString(),
      enrollmentNo: stuData[COL_ENROLLMENT_NO]?.toString(),
      email: stuData[COL_EMAIL]?.toString(),
      phoneNumber: stuData[COL_PHONENUMBER]?.toString(),
      branch: stuData[COL_BRANCH]?.toString(),
      cgpa: stuData[COL_CGPA] != null ? (stuData[COL_CGPA] as num).toDouble() : null,
      grade12: stuData[COL_12TH_GRADE]?.toString(),
    );
  }
}
