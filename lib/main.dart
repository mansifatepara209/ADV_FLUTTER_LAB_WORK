import 'package:adv_flutter_labs/import_export.dart';

void main(){
  runApp(GetMaterialApp(
    home: ProfileCardAddData(),
  ));
}


// void main(){
//   runApp(GetMaterialApp(
//     debugShowCheckedModeBanner: false,
//     initialRoute: NAV_USER_LISTVIEW_PAGE,
//     getPages: [
//       GetPage(name: NAV_USER_LISTVIEW_PAGE, page: () => StuListView()),
//       GetPage(name: NAV_USER_ADD_EDIT_PAGE, page: () => StuAddEditPage())
//     ],
//   ));
// }

// void main() {
//   runApp(GetMaterialApp(
//     debugShowCheckedModeBanner: false,
//     // home: HomeScreenNonReactive(),
//     // home: TimerCountDownScreen(),
//     // home: ToggleScreen(),
//     // home: RxListView(),
//     // home: FavView(),
//     // home: RxListViewPageAddDlt(),
//     home: CrudRxListView(),
//   ));
// }

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
// void main() {
//   var name;
//   runApp(
//     GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Page1(),
//       getPages: [
//         GetPage(
//           name: '/second',
//           page: () => Page2(),
//           transition: Transition.zoom,
//           transitionDuration: Duration(milliseconds: 600),
//         ),
//       ],
//     ),
//   );
// }

// void main(){
//   runApp(GetMaterialApp(
//     initialRoute: '/home',
//     getPages: [
//       GetPage(name: '/login', page: () => LoginScreen()),
//       GetPage(name: '/home', page: () => HomeScreen(),
//       middlewares: [UserMiddleware()]),
//     ],
//   ));
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
      // home: SignUpForm(),
      // home: FavUnFavWithStaticList(),
      home: ProfileCardAddData(),
      // home: UserListView(),
      // home: MainPage(),
      // home: FlipkartView(),
      // home: DialogView(),
      // home: StudentView(),
    );
  }
}
