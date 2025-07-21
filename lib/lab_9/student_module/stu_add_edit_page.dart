import '../../import_export.dart';

class StuAddEditPage extends StatelessWidget {
  StuAddEditPage({super.key});

  final StuController stuController = Get.find();
  final StuModel? student = Get.arguments; // Step 1: Get passed student

  @override
  Widget build(BuildContext context) {
    // Step 2: Pre-fill controllers only if editing
    if (student != null) {
      stuController.nameController.text = student!.stuName ?? '';
      stuController.enrollmentController.text = student!.enrollmentNo ?? '';
      stuController.emailController.text = student!.email ?? '';
      stuController.phoneController.text = student!.phoneNumber ?? '';
      stuController.branchController.text = student!.branch ?? '';
      stuController.cgpaController.text =
          student!.cgpa?.toStringAsFixed(2) ?? '';
      stuController.selectedGrade.value = student!.grade12 ?? '';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(student == null ? APPBAR_ADD_USER_PAGE : 'Edit Student'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: stuController.formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Name
                TextFormField(
                  controller: stuController.nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                  validator:
                      (value) => stuController.getValidationMessage(value),
                ),
                SizedBox(height: 10),
                // Enrollment
                TextFormField(
                  controller: stuController.enrollmentController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Enrollment No.'),
                  validator: (value) => stuController.getValidationMessage(value),
                  enabled: student == null,//it field is locked when you're in editing mode
                ),
                SizedBox(height: 10),
                // Email
                TextFormField(
                  controller: stuController.emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(labelText: 'Email'),
                  validator:
                      (value) => stuController.getValidationMessage(value),
                ),
                SizedBox(height: 10),
                // Phone
                TextFormField(
                  controller: stuController.phoneController,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  decoration: InputDecoration(labelText: 'Phone Number'),
                  validator:
                      (value) => stuController.getValidationMessage(value),
                ),
                SizedBox(height: 10),
                // Branch
                TextFormField(
                  controller: stuController.branchController,
                  decoration: InputDecoration(labelText: 'Branch'),
                  validator:
                      (value) => stuController.getValidationMessage(value),
                ),
                SizedBox(height: 10),
                // CGPA
                TextFormField(
                  controller: stuController.cgpaController,
                  decoration: InputDecoration(labelText: 'CGPA'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter CGPA';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                // 12th Grade
                Obx(
                      () => DropdownButtonFormField<String>(
                    decoration: InputDecoration(labelText: '12th Grade'),
                    value: stuController.selectedGrade.value.isEmpty
                        ? null
                        : stuController.selectedGrade.value,
                    items: stuController.gradeOptions
                        .map(
                          (grade) => DropdownMenuItem<String>(
                        value: grade,
                        child: Text(grade),
                      ),
                    )
                        .toList(),
                    onChanged: (value) {
                      stuController.selectedGrade.value = value ?? '';
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a grade';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if (stuController.formKey.currentState!.validate()) {
                      if (student != null) {
                        // Step 3: Call update if editing
                        await stuController.updateStuInTblStudent(student!.stuId!);
                      } else {
                        await stuController.addStuToTblStudent();
                      }
                      await stuController.getStuList();
                      stuController.clearControllers();
                      Get.back();
                    }
                  },
                  child: Text(BTN_SAVE),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
