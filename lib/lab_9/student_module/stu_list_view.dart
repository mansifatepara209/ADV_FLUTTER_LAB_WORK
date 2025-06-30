import '../../import_export.dart';

class StuListView extends StatelessWidget {
  StuListView({super.key});
  // final StuController controller = Get.put(StuController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(APPBAR_USER_LIST_VIEW),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(NAV_USER_ADD_EDIT_PAGE);
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: GetX<StuController>(
        init: StuController(),
        builder: (controller) {
          return controller.stuList.isNotEmpty
              ? ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(controller.stuList[index].stuName.toString()),
                    trailing: Icon(Icons.delete,color: Colors.red,),
                  );
                },
                itemCount: controller.stuList.length,
              )
              : Center(
                child: Text(
                  CMN_NO_DATA_FOUND,
                  style: TextStyle(color: Colors.grey),
                ),
              );
        },
      ),
    );
  }
}
