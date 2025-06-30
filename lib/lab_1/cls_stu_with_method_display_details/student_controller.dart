import 'package:adv_flutter_labs/import_export.dart';
class StudentController {
  late StudentModel student;

  StudentController() {
    student = StudentModel(name: "Mansi", age: 20, grade: "A+");
  }

  String getStudentDetails() {
    return student.getDetails();
  }
}
