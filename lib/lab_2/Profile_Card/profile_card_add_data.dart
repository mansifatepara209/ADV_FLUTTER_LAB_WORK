import '../../import_export.dart';

class ProfileCardAddData extends StatelessWidget {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final occupationController = TextEditingController();

  ProfileCardController profileCardController = Get.put(ProfileCardController());


  ProfileCardAddData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Profile'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'enter name'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'enter email'),
            ),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: 'enter mobile number'),
            ),
            TextField(
              controller: occupationController,
              decoration: InputDecoration(labelText: 'enter occupation'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                profileCardController.setUserData(
                  nameController.text,
                  emailController.text,
                  phoneController.text,
                  occupationController.text,
                );
                Get.to(() => ProfileCardView());
              },
              child: Text('Create Profile Card'),
            ),
          ],
        ),
      ),
    );
  }
}
