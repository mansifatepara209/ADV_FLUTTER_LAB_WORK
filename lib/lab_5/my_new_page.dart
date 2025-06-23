import 'package:adv_flutter_labs/lab_4/custom_dialog/custom_dialog_controller.dart';

import '../import_export.dart';

class MyNewPage extends StatelessWidget {
  CustomDialogController customDialogController = CustomDialogController();
  MyNewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My New Page'),centerTitle: true,),
      body: Column(
        children: [
          SizedBox(height: 100,),
          Center(
            child: ElevatedButton(
              onPressed: () {
                customDialogController.showCustomAlertDialog();
              },
              child: Text('Check My Dialog Box'),
            ),
          ),
          SizedBox(height: 30,),
          ElevatedButton(onPressed: () {
            Get.back();
          }, child: Text('BACK TO OUR HOME PAGE'))
        ],
      ),
    );
  }
}
