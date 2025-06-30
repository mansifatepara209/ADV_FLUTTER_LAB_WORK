import 'package:adv_flutter_labs/import_export.dart';

class RxListController extends GetxController{
  RxList<String> list = <String>[].obs;
  int count = 1;

  void addData(){
    list.add('Item $count');
    count++;
  }

}