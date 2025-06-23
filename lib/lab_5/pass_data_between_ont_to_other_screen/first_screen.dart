import 'package:adv_flutter_labs/lab_5/pass_data_between_ont_to_other_screen/second_screen.dart';

import '../../import_export.dart';

class FirstScreen extends StatelessWidget {
  FirstScreen({super.key});

  var nameController = TextEditingController();
  var emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First Screen'), centerTitle: true),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Enter Your Name',
                hintText: 'ex. Name Surname',
              ),
            ),
            // SizedBox(height: 20,),
            // TextField(
            //   controller: emailController,
            //   decoration: InputDecoration(
            //     labelText: 'Enter Your Email',
            //     hintText: 'ex. example@gmail.com',
            //   ),
            // ),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: () {
              if (nameController.text.trim().isNotEmpty) {
                Get.toNamed('/second',arguments: nameController.text);
              } else {
                Get.snackbar("Error!!", "Please enter your name.");
              }
            }, child: Text('Go To Second Screen'))
          ],
        ),
      ),
    );
  }
}
