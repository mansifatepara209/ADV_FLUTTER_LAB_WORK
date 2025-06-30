class StudentModel {
  final String name;
  final int age;
  final String grade;

  StudentModel({required this.name, required this.age, required this.grade});

  String getDetails() {
    return 'Name: $name\nAge: $age\nGrade: $grade';
  }
}
