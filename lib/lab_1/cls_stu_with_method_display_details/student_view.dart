import '../../import_export.dart';

class StudentView extends StatelessWidget {
  final StudentController controller = StudentController();

  StudentView({super.key});

  @override
  Widget build(BuildContext context) {
    String details = controller.getStudentDetails();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Details'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            details,
            style: const TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
