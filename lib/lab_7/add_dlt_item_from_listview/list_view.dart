import '../../import_export.dart';

class RxListViewPageAddDlt extends StatelessWidget {
  RxListViewPageAddDlt({super.key});

  final listController = Get.put(ListController());
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("RxList Add/Delete Example")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Item',
                    ),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    if (textController.text.isNotEmpty) {
                      listController.addItem(textController.text);
                      textController.clear();
                    }
                  },
                  child: Text("Add"),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() => ListView.builder(
              itemCount: listController.items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(listController.items[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => listController.removeItem(index),
                  ),
                );
              },
            )),
          ),
        ],
      ),
    );
  }
}
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(title: Text('RxLIst Add/Delete Items Example')),
  //     body: Column(
  //       children: [
  //         Padding(
  //           padding: const EdgeInsets.all(16.0),
  //           child: Row(
  //             children: [
  //               Expanded(
  //                 child: TextField(
  //                   controller: textController,
  //                   decoration: InputDecoration(
  //                     border: OutlineInputBorder(),
  //                     labelText: 'Enter Item Name',
  //                   ),
  //                 ),
  //               ),
  //               SizedBox(width: 8),
  //               ElevatedButton(
  //                 onPressed: () {
  //                   if (textController.text.isNotEmpty) {
  //                     listController.addItem(textController.text);
  //                     textController.clear();
  //                   }
  //                 },
  //                 child: Text('Add'),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
// }
