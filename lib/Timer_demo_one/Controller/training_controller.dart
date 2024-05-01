import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrainingController extends GetxController with GetSingleTickerProviderStateMixin {
  // RxInt selectedButtonIndex = RxInt(-1);
  late AnimationController controller;

  RxBool isPlaying = RxBool(false);
  RxString countText = RxString("00:02:00");
  RxString str = RxString("");

  RxDouble progress = RxDouble(1.0);


  RxInt progressCounter = RxInt(0);
  RxInt currentValue = RxInt(0);
  RxInt lastSecond = RxInt(1200);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(minutes: 2),
    );

    controller.addListener(() {
      if (controller.isDismissed) {
        countText.value = '${(controller.duration!.inHours).toString().padLeft(2, "0")}:${(controller.duration!.inMinutes % 60).toString().padLeft(2, '0')}:${(controller.duration!.inSeconds % 60).toString().padLeft(2, '0')}';
        print("---------vv---->>>${controller.duration!.inSeconds}");
      } else {
        Duration count = controller.duration! * controller.value;
        countText.value = '${(count.inHours).toString().padLeft(2, "0")}:${(count.inMinutes % 60).toString().padLeft(2, '0')}:${(count.inSeconds % 60).toString().padLeft(2, '0')}';

        var progressCalculation = (count.inSeconds / controller.duration!.inSeconds) * 100;
        progressCounter.value = (100 - progressCalculation.toInt());
        // print("-------progressCalculation ------->>> $progressCalculation");

        // if (lastSecond.value != count.inSeconds) {
        //   lastSecond.value = count.inSeconds;
        //   currentValue = currentValue + 1;
        //   if (currentValue.value == 12) {
        //     progressCounter = progressCounter + 1;
        //     currentValue.value = 0;
        //     print("------inSeconds------->>>${count.inSeconds}");
        //     print("---counter---progressCounter------->>>${progressCounter}");
        //     print("---counter---currentValue------->>>${currentValue}");
        //   }
        // }
      }

      if (controller.isAnimating) {
        progress.value = controller.value;
      } else {
        progress.value = 1.0;
        isPlaying.value = false;
      }
    });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    controller.dispose();
    super.onClose();
  }
}
