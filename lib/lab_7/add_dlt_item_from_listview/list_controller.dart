import 'package:adv_flutter_labs/import_export.dart';

class ListController extends GetxController{
  var items = <String>[].obs;

  void addItem(String value){
    items.add(value);
  }

  void removeItem(int index){
    items.removeAt(index);
  }

}