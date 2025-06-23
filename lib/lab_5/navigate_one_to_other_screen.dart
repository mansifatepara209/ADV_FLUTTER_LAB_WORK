import 'package:adv_flutter_labs/lab_5/my_new_page.dart';

import '../import_export.dart';

class NavigateOneToOtherScreen extends StatelessWidget {
  const NavigateOneToOtherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Navigate One Screen To Another Screen'),centerTitle: true,),
      body: Center(
        child: ElevatedButton(onPressed: () {
          Get.to(MyNewPage());
        }, child: Text('Navigate My New page')),
      ),
    );
  }
}
