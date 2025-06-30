import 'package:adv_flutter_labs/import_export.dart';

class UserMiddleware extends GetMiddleware{
  RouteSettings? redirect(String? route){
    bool isLogin = false;
    if(!isLogin){
      return RouteSettings(name:'/home');
    }
    return RouteSettings(name:'/login');
  }
}