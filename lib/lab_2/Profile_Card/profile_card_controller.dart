import 'package:adv_flutter_labs/import_export.dart';

class ProfileCardController extends GetxController{
  var name = ''.obs;
  var email = ''.obs;
  var phone = ''.obs;
  var occupation = ''.obs;

  void setUserData(String n,String e,String p,String o){
    name.value = n;
    email.value = e;
    phone.value = p;
    occupation.value = o;
  }
}