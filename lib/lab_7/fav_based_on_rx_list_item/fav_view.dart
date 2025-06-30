import 'package:adv_flutter_labs/lab_7/fav_based_on_rx_list_item/fav_controller.dart';

import '../../import_export.dart';

class FavView extends StatelessWidget {
  final favController = Get.put(FavController());

  FavView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Favourite Icon with RxList')),
      body: Obx(() {
        return ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Item ${index + 1}'),
              trailing: IconButton(
                onPressed: () {
                  favController.toggleFav(index);
                },
                icon:Icon(favController.isFavList[index]
                    ? Icons.favorite
                    : Icons.favorite_outline,),
                color:
                    favController.isFavList[index] ? Colors.red : Colors.grey,
              ),
            );
          },
          itemCount: favController.isFavList.length,
        );
      }),
    );
  }
}
