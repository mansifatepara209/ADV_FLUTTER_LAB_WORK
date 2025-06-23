import '../../import_export.dart';

class SecondScreen extends StatelessWidget {
  SecondScreen({super.key,required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MY SECOND SCREEN'),centerTitle: true,),
      body: Center(
        child: Column(
          children: [
            Center(child: Text('Hello my name is , $name',style: TextStyle(fontSize: 50),)),
          ],
        ),
      ),
    );
  }
}