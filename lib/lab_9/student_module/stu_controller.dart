import 'package:adv_flutter_labs/database/my_database.dart';
import 'package:adv_flutter_labs/import_export.dart';

class StuController extends GetxController {
  RxList<StuModel> stuList = <StuModel>[].obs;
  late Database db;
  GlobalKey<FormState> formKey = GlobalKey();
  var nameController = TextEditingController();
  var enrollmentController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var branchController = TextEditingController();
  var cgpaController = TextEditingController();
  var grade12Controller = TextEditingController();
  RxString selectedGrade = ''.obs;
  List<String> gradeOptions = ['A', 'B', 'C', 'D', 'E'];
  RxString searchText = ''.obs;
  RxBool isSortAscending = true.obs;



  @override
  void onInit() {
    super.onInit();
    MyDatabase().initDatabase().then((value) {
      db = value;
      getStuList();
    });
  }

  Future<void> getStuList() async {
    stuList.clear();
    final order = isSortAscending.value ? 'ASC' : 'DESC';
    List<Map<String, Object?>> students = await db.rawQuery(
      'SELECT * FROM $TBL_STUDENT ORDER BY stuId $order',
    );
    for (var element in students) {
      stuList.add(StuModel.fromMap(element));
    }
  }


  String? getValidationMessage(value) {
    if (value == null || value.trim().isEmpty) {
      return MSG_VALID_VALUE;
    }
    return null;
  }

  Future<void> addStuToTblStudent() async {
    StuModel newStudent = StuModel(
      stuName: nameController.text.trim(),
      enrollmentNo: enrollmentController.text.trim(),
      email: emailController.text.trim(),
      phoneNumber: phoneController.text.trim(),
      branch: branchController.text.trim(),
      cgpa: double.tryParse(cgpaController.text.trim()),
      grade12: selectedGrade.value,
    );
    await db.insert(TBL_STUDENT, newStudent.toMap());
    stuList.clear(); // to avoid duplicate entries
    await getStuList();
  }

  Future<void> updateStuInTblStudent(int stuId) async {
    StuModel updatedStudent = StuModel(
      stuId: stuId,
      stuName: nameController.text.trim(),
      enrollmentNo: enrollmentController.text.trim(),
      email: emailController.text.trim(),
      phoneNumber: phoneController.text.trim(),
      branch: branchController.text.trim(),
      cgpa: double.tryParse(cgpaController.text.trim()),
      grade12: selectedGrade.value,
    );

    await db.update(
      TBL_STUDENT,
      updatedStudent.toMap(),
      where: 'stuId = ?',
      whereArgs: [stuId],
    );
  }



  Future<void> deleteStuFromList(int stuId) async {
    await db.rawDelete('DELETE FROM TBL_Student WHERE stuId = ?', [stuId]);
    await getStuList();
  }

  List<StuModel> get filteredStuList {
    if (searchText.value.isEmpty) return stuList;
    final query = searchText.value.toLowerCase();
    return stuList.where((stu) {
      return (stu.stuName?.toLowerCase().contains(query) ?? false) ||
          (stu.email?.toLowerCase().contains(query) ?? false) ||
          (stu.branch?.toLowerCase().contains(query) ?? false);
    }).toList();
  }


  void clearControllers() {
    nameController.clear();
    enrollmentController.clear();
    emailController.clear();
    phoneController.clear();
    branchController.clear();
    cgpaController.clear();
    grade12Controller.clear();
    selectedGrade.value = '';
  }
}
