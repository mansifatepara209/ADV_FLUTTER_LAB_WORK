import 'package:adv_flutter_labs/lab_4/custom_dialog/custom_dialog_controller.dart';

import '../../import_export.dart';

class CustomDialogView extends StatelessWidget {
  CustomDialogController customDialogController = CustomDialogController();
  CustomDialogView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Custom Dialog View')),
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
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          customDialogController.showCustomBottomSheet();
        },
        child: Icon(Icons.play_circle_rounded),
      ),
    );
  }
}
