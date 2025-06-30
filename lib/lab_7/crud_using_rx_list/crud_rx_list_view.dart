
import '../../import_export.dart';

class CrudRxListView extends StatelessWidget {
  final crudRxListController = Get.put(CrudRxListController());

  final nameController = TextEditingController();
  final ageController = TextEditingController();
  // RxInt editingId = 0.obs;

  CrudRxListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("RxList<Map> CRUD Example")),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Obx(
              () => Text(
                crudRxListController.editingId.value == 0 ? 'Add New Data' : 'Edit Data',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: ageController,
              decoration: InputDecoration(labelText: "Age"),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              onPressed: () {
                final name = nameController.text;
                final age = int.tryParse(ageController.text) ?? 0;
                if (crudRxListController.editingId.value == 0) {
                  crudRxListController.addData(name, age);
                } else {
                  crudRxListController.updateData(crudRxListController.editingId.value, name, age);
                  crudRxListController.editingId.value = 0;
                }
                nameController.clear();
                ageController.clear();
              },
              child: Obx(() => Text(crudRxListController.editingId.value == 0 ? "Add" : "Update")),
            ),
            Divider(),
            Expanded(
              child: Obx(
                () => Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: ListView.builder(
                    itemCount: crudRxListController.dataList.length,
                    itemBuilder: (context, index) {
                      final item = crudRxListController.dataList[index];
                      return ListTile(
                        title: Text(item['name']),
                        subtitle: Text("Age: ${item['age']}"),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit, color: Colors.orange),
                              onPressed: () {
                                nameController.text = item['name'];
                                ageController.text = item['age'].toString();
                                crudRxListController.editingId.value = item['id'];
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed:
                                  () =>
                                      crudRxListController.deleteData(item['id']),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:adv_flutter_labs/lab_7/crud_using_rx_list/crud_rx_list_controller.dart';
//
// import '../../import_export.dart';
//
// class CrudRxListView extends StatelessWidget {
//   final crudRListController = Get.put(CrudRxListController());
//   final nameController = TextEditingController();
//   final ageController = TextEditingController();
//   CrudRxListView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('RxList<Map> CRUD Operation Example'),),
//       body: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Column(
//           children: [
//
//           ],
//         ),
//       ),
//     );
//   }
// }
