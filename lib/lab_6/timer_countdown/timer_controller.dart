import 'dart:async';
import '../../import_export.dart';

class TimerController extends GetxController {
  RxInt countdown = 10.obs;
  Timer? _timer;

  void startTimer() {
    _timer?.cancel(); // Cancel previous timer if any
    countdown.value = 10; // Reset value

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (countdown.value > 0) {
        countdown.value--;
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void onClose() {
    _timer?.cancel(); // Cancel timer on dispose
    super.onClose();
  }
}