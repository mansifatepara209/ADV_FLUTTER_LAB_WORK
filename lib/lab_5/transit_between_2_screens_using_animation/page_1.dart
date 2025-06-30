import '../../import_export.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page 1'),),
      body: Center(
        child: ElevatedButton(onPressed: () {
          Get.toNamed('/second');
        }, child: Text('Go!!')),
      ),
    );
  }
}