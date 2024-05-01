import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:timer_demo_app/TimerDemoTwo/View/timer_with_dor_pointer.dart';
import 'package:timer_demo_app/Timer_demo_one/Controller/training_controller.dart';

/// progress grey line and start stop button
class TrainingScreen extends StatelessWidget {
  final String? iconImage;

  const TrainingScreen({super.key, this.iconImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.tealAccent,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Timer Demo One",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(const TimerWithDotPointerDemoScreen());
            },
            icon: const Icon(Icons.arrow_forward_outlined, color: Colors.black),
          ),
        ],
      ),
      body: GetX<TrainingController>(
          init: TrainingController(),
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  /// Time View
                  Expanded(
                    flex: 6,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 300,
                          height: 300,
                          child: CircularStepProgressIndicator(
                            totalSteps: 100,
                            currentStep: controller.progressCounter.value,
                            // totalSteps: 1,
                            // currentStep: 1,
                            stepSize: 40,
                            selectedColor: Colors.tealAccent,
                            unselectedColor: Colors.tealAccent.withOpacity(0.1),
                            padding: 0.1,
                            width: 200,
                            height: 200,
                            startingAngle: 0,
                            arcSize: math.pi * 2,
                            // startingAngle: -math.pi * 2 / 2,
                            // arcSize: math.pi * 2 / 3 * 2,
                          ),
                          // CircularProgressIndicator(
                          //   backgroundColor: Colors.grey.shade400,
                          //   // backgroundColor: Colors.red,
                          //   value: controller.progress.value,
                          //   strokeWidth: 6,
                          // ),
                        ),
                        AnimatedBuilder(
                          animation: controller.controller,
                          builder: (context, child) => Image.asset(
                            "assets/images/cycle.png",
                            height: 93,
                            width: 88,
                            color: Colors.tealAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: AnimatedBuilder(
                      animation: controller.controller,
                      builder: (context, child) => Text(
                        controller.countText.value,
                        style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold, color: Colors.tealAccent),
                      ),
                    ),
                  ),

                  /// Start and Stop View
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (controller.controller.isAnimating) {
                                controller.controller.stop();
                                controller.isPlaying.value = false;
                              } else {
                                controller.controller.reverse(from: controller.controller.value == 0 ? 1.0 : controller.controller.value);
                                controller.isPlaying.value = true;
                              }
                            },
                            child: RoundButton(
                              icon: controller.isPlaying.value == true ? Icons.pause : Icons.play_arrow,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.controller.reset();
                              controller.lastSecond.value = 300;
                              controller.currentValue.value = 0;
                              controller.progressCounter.value = 0;
                              controller.isPlaying.value = false;
                            },
                            child: const RoundButton(
                              icon: Icons.stop,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

class RoundButton extends StatelessWidget {
  const RoundButton({
    Key? key,
    required this.icon,
  }) : super(key: key);
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: CircleAvatar(
        backgroundColor: Colors.tealAccent,
        radius: 30,
        child: Icon(
          icon,
          size: 36,
          color: Colors.black,
        ),
      ),
    );
  }
}
