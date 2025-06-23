// WAP to show Dialog with title, AlertMessage, and buttons using Getx.
import '../../import_export.dart';

class DialogView extends StatelessWidget {
  DialogController dialogViewController = Get.put(DialogController());
  DialogView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GetX Demo'),centerTitle: true,),
      body: Center(
        child: ElevatedButton(onPressed: () {
          dialogViewController.showAlertDialog();
        }, child: Text('Show Dialog')),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        dialogViewController.showBottomSheet();
      },child: Icon(Icons.play_circle),),
    );
  }
}
