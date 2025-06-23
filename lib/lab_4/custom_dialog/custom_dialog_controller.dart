import 'package:adv_flutter_labs/import_export.dart';

class CustomDialogController extends GetxController{
  void showCustomAlertDialog(){
    Get.defaultDialog(
      backgroundColor: Colors.lightGreen,
      title: 'Alert!!',
      content: Text('Are you sure you want to delete?'),
      actions: [
        TextButton(onPressed: () {
          Get.back();
          Get.snackbar("You're Confirmed", "You have confirmation From US!!");
        }, child: Text('Yes',style: TextStyle(color: Colors.white),)),
        TextButton(onPressed: () {
          Get.back();
          Get.snackbar("Not Confirm!!", "Please Try Again!!");
        }, child: Text('No',style: TextStyle(color: Colors.white),))
      ]
    );
  }
  void showCustomBottomSheet() {
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