import 'package:adv_flutter_labs/lab_6/rx_bool_toggle/toggle_controller.dart';

import '../../import_export.dart';

class ToggleScreen extends StatelessWidget {
  final toggleController = ToggleController();

  ToggleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('RxBool Show/Hide Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () =>
                  toggleController.isVisible.value
                      ? Text(
                        'This Is Visible!!',
                        style: TextStyle(fontSize: 25),
                      )
                      : SizedBox(),
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: toggleController.toggleVisibility, child: Obx(() => Text(toggleController.isVisible.value ? 'Hide Content' : 'Show Content')))
          ],
        ),
      ),
    );
  }
}
