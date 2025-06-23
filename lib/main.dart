import 'package:adv_flutter_labs/import_export.dart';
import 'package:adv_flutter_labs/lab_2/e_commerce/flipcart_view.dart';
import 'package:adv_flutter_labs/lab_4/dialog_getx/dialog_view.dart';
import 'package:adv_flutter_labs/lab_5/navigate_one_to_other_screen.dart';
import 'package:adv_flutter_labs/lab_5/pass_data_between_ont_to_other_screen/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_flutter_labs/LAB_2/First_FavOrUnFavWithStaticList.dart';
import 'package:adv_flutter_labs/LAB_2/Second_SignUpForm.dart';
import 'LAB_2/Profile_Card/profile_card_add_data.dart';
import 'lab_3/crud_mvc/add_user_page.dart';
import 'lab_3/crud_mvc/user_list_view.dart';
import 'lab_4/custom_dialog/custom_dialog_view.dart';
import 'lab_5/pass_data_between_ont_to_other_screen/first_screen.dart';

// void main() {
//   runApp(GetMaterialApp(
//     debugShowCheckedModeBanner: false,
//     initialRoute: '/',
//     getPages: [
//       GetPage(name: '/', page: () => FirstScreen()),
//       GetPage(name: '/second', page: () => SecondScreen(name: Get.arguments),)
//     ],
//   ));
// }
void main(){
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProfileCardView(),
  ));
}

// void main() {
//   runApp(MaterialApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      // home: SignUpForm(),
      // home: FavUnFavWithStaticList(),
      // home: ProfileCardAddData(),
      // home: UserListView(),
      // home: MainPage(),
      // home: FlipkartView(),
      // home: DialogView(),
    );
  }
}
