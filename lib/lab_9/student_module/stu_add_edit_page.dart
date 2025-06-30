import '../../import_export.dart';

class StuAddEditPage extends StatelessWidget {
  StuAddEditPage({super.key});

  StuController stuController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(APPBAR_ADD_USER_PAGE)),
      body: Form(
        key: stuController.formKey,
        child: Column(
          children: [
            TextFormField(
              controller: stuController.nameController,
              validator: (value) => stuController.getValidationMessage(value),
            ),
            ElevatedButton(
              onPressed: () async {
                if (stuController.formKey.currentState!.validate()) {
                  await stuController.addStuToTblStudent(
                    name: stuController.nameController.text.toString(),
                  );
                  stuController.nameController.clear();
                  Get.back();
                }
              },
              child: Text(BTN_SAVE),
            ),
          ],
        ),
      ),
    );
  }
}
