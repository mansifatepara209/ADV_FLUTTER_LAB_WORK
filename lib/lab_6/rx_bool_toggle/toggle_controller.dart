import 'package:adv_flutter_labs/import_export.dart';

class ToggleController extends GetxController{
  RxBool isVisible = true.obs;

  void toggleVisibility(){
    isVisible.value = !isVisible.value;
  }
}