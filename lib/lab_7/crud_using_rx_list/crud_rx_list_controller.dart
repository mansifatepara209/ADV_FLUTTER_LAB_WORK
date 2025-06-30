import 'package:adv_flutter_labs/import_export.dart';

class CrudRxListController extends GetxController {
  var dataList = <Map<String, dynamic>>[].obs;
  RxInt editingId = 0.obs;

  void addData(String name, int age) {
    dataList.add({
      "id": DateTime.now().millisecondsSinceEpoch,
      "name": name,
      "age": age,
    });
  }

  void deleteData(int id) {
    dataList.removeWhere((item) => item['id'] == id);
  }

  void updateData(int id, String name, int age) {
    final index = dataList.indexWhere((element) => element['id'] == id);
    if (index != -1) {
      dataList[index] = {'id': id, 'name': name, 'age': age};
    }
  }

  void getData() {}
}
