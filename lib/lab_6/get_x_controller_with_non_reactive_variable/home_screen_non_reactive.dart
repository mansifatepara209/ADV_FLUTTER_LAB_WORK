import '../../import_export.dart';

class HomeScreenNonReactive extends StatelessWidget {
  HomeScreenNonReactive({super.key});
  final counterController = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rx String With TextFeild'),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Enter your name'),
              onChanged: (value) {
                counterController.name.value = value;
              },
            ),
            SizedBox(height: 20,),
            Obx(()=>Text('Hello ${counterController.name}',style: TextStyle(fontSize: 30),))
          ],
        ),
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(title: Text('Rx Variable with Obx')),
    //   body: Center(
    //     child: Obx(
    //       () => Text(
    //         'Count: ${counterController.counter}',
    //         style: TextStyle(fontSize: 30),
    //       ),
    //     ),
    //   ),
    //   floatingActionButton: FloatingActionButton(onPressed: counterController.increment,child: Icon(Icons.add),),
    // );
    // return Scaffold(
    //   appBar: AppBar(title: Text('Non-Reactive GetX'),),
    //   body: Center(
    //     child: GetBuilder<CounterController>(
    //       builder: (controller) {
    //         return Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Text("Counter Value: ${counterController.counter}",style: TextStyle(fontSize: 24),),
    //             SizedBox(height: 30,),
    //             ElevatedButton(onPressed: counterController.increment, child: Text('Increment'),),
    //             SizedBox(height: 20,),
    //             ElevatedButton(onPressed: counterController.reset, child: Text('Reset'))
    //           ],
    //         );
    //       },
    //     ),
    //   ),
    // );
  }
}
