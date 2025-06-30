import 'package:adv_flutter_labs/import_export.dart';

class FavController extends GetxController{
  RxList<bool> isFavList = RxList<bool>([false,false,false]);

  void toggleFav(int index){
    isFavList[index] = !isFavList[index];
  }
}