import '../../import_export.dart';

class RxListView extends StatelessWidget {
  final rxListController = Get.put(RxListController());

  RxListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Display List Using RxList')),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(title: Text(rxListController.list[index]),);
                },
                itemCount: rxListController.list.length,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        rxListController.addData();
      },child: Icon(Icons.add),),
    );
  }
}
