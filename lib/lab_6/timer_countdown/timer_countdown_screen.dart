import '../../import_export.dart';

class TimerCountDownScreen extends StatelessWidget {
  final TimerController timerController = Get.put(TimerController());

  TimerCountDownScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Countdown Timer (RxInt)')),
      body: Center(
        child: Obx(() => Text(
          'Countdown: ${timerController.countdown}',
          style: TextStyle(fontSize: 40),
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          timerController.startTimer();
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}