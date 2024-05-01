import 'package:circular_seek_bar/circular_seek_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timer_demo_app/TimerDemoTwo/Controller/timer_with_dot_circular_demo_two_controller.dart';
import 'package:timer_demo_app/demo_only.dart';

/// progress grey line and start stop button
class TimerWithDotPointerDemoScreen extends StatelessWidget {
  const TimerWithDotPointerDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<double> valueNotifier = ValueNotifier(0);

    return GetX<TimerControllerWithDotePointerTwo>(
      init: TimerControllerWithDotePointerTwo(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.indigo,
            iconTheme: const IconThemeData(
              color: Colors.white,
            ),
            title: const Text(
              "Timer with Dot Pointer",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Get.to(const CircularSeekBarExamplePage());
                },
                icon: const Icon(Icons.arrow_forward_outlined, color: Colors.black),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    controller.lastSecond.value = 300;
                    controller.currentValue.value = 0;
                    controller.progressCounter.value = 0;
                    controller.isPlaying.value = false;
                    controller.controller.reset();
                  },
                  child: const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.restart_alt),
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: const Color(0xffF4F5F6),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// Body Part
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 554,
                    width: 361,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      // color: Colors.black,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        /// Time View
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            const SizedBox(
                              height: 240,
                              width: 240,
                              child: Image(
                                image: AssetImage("assets/images/timerIcon.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 9, right: 9),
                              child: SizedBox(
                                width: 204,
                                height: 204,
                                child: CircularSeekBar(
                                  width: double.infinity,
                                  height: 250,
                                  progress: controller.progress.value,
                                  barWidth: 12,
                                  startAngle: 180,
                                  sweepAngle: 360,
                                  strokeCap: StrokeCap.butt,
                                  innerThumbRadius: 7,
                                  innerThumbStrokeWidth: 5,
                                  innerThumbColor: Colors.indigo,
                                  outerThumbRadius: 5,
                                  outerThumbStrokeWidth: 10,
                                  outerThumbColor: Colors.white,
                                  dashWidth: 1,
                                  dashGap: 1.5,
                                  animation: true,
                                  progressColor: Colors.grey.shade100,
                                  maxProgress: 1,
                                  minProgress: 0,
                                  trackColor: Colors.indigo,
                                  valueNotifier: valueNotifier,
                                ),
                              ),
                            ),
                            // Padding(
                            //   padding: EdgeInsets.only(bottom: 9.sp,right: 9.sp),
                            //   child: SizedBox(
                            //     width: 204.sp,
                            //     height: 204.sp,
                            //     child: CircularStepProgressIndicator(
                            //       totalSteps: 100,
                            //       currentStep: controller.progressCounter.value,
                            //       // totalSteps: 1,
                            //       // currentStep: 1,
                            //       stepSize: 12,
                            //       selectedColor: const Color(0xffDD000F),
                            //       // unselectedColor: Color(0xffFDF2F3),
                            //       unselectedColor: Colors.grey.shade400,
                            //       padding: 0.1,
                            //       width: 200,
                            //       height: 200,
                            //       startingAngle: 0,
                            //       arcSize: math.pi * 2,
                            //       // startingAngle: -math.pi * 2 / 2,
                            //       // arcSize: math.pi * 2 / 3 * 2,
                            //     ),
                            //   ),
                            // ),
                            const Padding(
                              padding: EdgeInsets.only(bottom: 8),
                              child: SizedBox(
                                height: 70,
                                width: 76,
                                child: Image(
                                  image: AssetImage("assets/images/sportIcon1.png"),
                                  fit: BoxFit.contain,
                                  // color: Color(0xffDD000F),
                                  color: Colors.indigo,
                                ),
                              ),
                            ),
                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 18.0),
                          child: AnimatedBuilder(
                            animation: controller.controller,
                            builder: (context, child) => Text(
                              controller.countText.value,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 45,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                        /// Start and Stop View
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: GestureDetector(
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
                              icon: controller.isPlaying.value == true ? Icons.pause : Icons.play_arrow_outlined,
                              // color: const Color(0xffDD000F),
                              color: Colors.indigo,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class RoundButton extends StatelessWidget {
  const RoundButton({
    Key? key,
    required this.icon,
    this.color,
  }) : super(key: key);
  final IconData icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: CircleAvatar(
        // backgroundColor: const Color(0xffFDF2F3),
        backgroundColor: const Color(0xff0019F9).withOpacity(0.2),
        radius: 30,
        child: Icon(
          icon,
          size: 36,
          color: color,
        ),
      ),
    );
  }
}
