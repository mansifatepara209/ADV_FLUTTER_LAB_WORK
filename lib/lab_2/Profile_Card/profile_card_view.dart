import '../../import_export.dart';

class ProfileCardView extends StatelessWidget {
  ProfileCardView({super.key});

  ProfileCardController profileCardController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile Card'), centerTitle: true),
      body: Center(
        child: Card(
          elevation: 8,
          margin: EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Obx(
              () => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 40,
                    child: Text(
                      profileCardController.name.value[0].toUpperCase(),
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    profileCardController.name.value,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    profileCardController.email.value,
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    profileCardController.phone.value,
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    profileCardController.occupation.value,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
