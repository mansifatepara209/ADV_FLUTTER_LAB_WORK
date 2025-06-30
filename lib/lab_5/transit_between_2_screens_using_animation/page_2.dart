import '../../import_export.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page 2'),),
      body: Center(child: ElevatedButton(onPressed: () {
        Get.back();
      }, child: Text('Back To Page 1')),),
    );
  }
}
