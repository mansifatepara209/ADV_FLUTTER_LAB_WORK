import '../../import_export.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login Screen")),
      body: Center(
        child: ElevatedButton(
          child: const Text("Go to Home"),
          onPressed: () {
            Get.toNamed("/home");
          },
        ),
      ),
    );
  }
}
