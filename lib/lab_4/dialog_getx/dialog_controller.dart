import 'package:adv_flutter_labs/import_export.dart';

class DialogController extends GetxController {
  void showAlertDialog() {
    Get.defaultDialog(
      title: 'Hello This is Default GETX Dialog',
      middleText: 'Are you sure you want to continue?',
      textConfirm: 'YES',
      textCancel: 'NO',
      onConfirm: () {
        Get.back();
        Get.snackbar('Confirmed!', 'You have confirmaton from us!!');
      },
      onCancel: () {
        Get.back();
      },
    );
  }

  void showBottomSheet() {
    Get.bottomSheet(
      Container(
        height: 400,
        child: Row(children: [Container(width: 100)]),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
      ),
    );
  }
}
