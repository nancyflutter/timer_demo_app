import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'dart:math' as math;

class TimerDemoScreen extends StatefulWidget {
  const TimerDemoScreen({super.key});

  @override
  State<TimerDemoScreen> createState() => _TimerDemoScreenState();
}

class _TimerDemoScreenState extends State<TimerDemoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildCircularStepProgressIndicator(),
        ],
      ),
    );
  }

  CircularStepProgressIndicator _buildCircularStepProgressIndicator() {
    return const CircularStepProgressIndicator(
      totalSteps: 30,
      currentStep: 12,
      stepSize: 40,
      selectedColor: Colors.yellowAccent,
      unselectedColor: Colors.yellowAccent,
      padding: 0.1,
      width: 200,
      height: 200,
      startingAngle: -math.pi * 2 / 2,
      arcSize: math.pi * 2 / 3 * 2,
      gradientColor: LinearGradient(
        colors: [
          Colors.yellowAccent,
          Colors.yellowAccent,
        ],
      ),
    );
  }
}
