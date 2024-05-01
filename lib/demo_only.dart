import 'package:circular_seek_bar/circular_seek_bar.dart';
import 'package:flutter/material.dart';

class CircularSeekBarExamplePage extends StatefulWidget {
  const CircularSeekBarExamplePage({Key? key}) : super(key: key);

  @override
  State<CircularSeekBarExamplePage> createState() =>
      _CircularSeekBarExamplePageState();
}

class _CircularSeekBarExamplePageState
    extends State<CircularSeekBarExamplePage> {
  final ValueNotifier<double> _valueNotifier = ValueNotifier(0);

  double _progress = 90;
  double _startAngle = 45;
  double _sweepAngle = 270;
  double _dashWidth = 0;
  double _dashGap = 0;
  double _barWidth = 8.0;
  bool _useGradient = true;
  bool _rounded = true;
  bool _animation = true;
  bool _thumbVisible = true;
  bool _interactive = true;

  @override
  void dispose() {
    _valueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter circular_seek_bar example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            CircularSeekBar(
              width: double.infinity,
              progress: _progress,
              height: 250,
              barWidth: _barWidth,
              startAngle: _startAngle,
              sweepAngle: _sweepAngle,
              strokeCap: _rounded ? StrokeCap.round : StrokeCap.butt,
              progressGradientColors: _useGradient
                  ? [
                Colors.red,
                Colors.orange,
                Colors.yellow,
                Colors.green,
                Colors.blue,
                Colors.indigo,
                Colors.purple
              ]
                  : [],
              dashWidth: _dashWidth,
              dashGap: _dashGap,
              animation: _animation,
              curves: Curves.linear,
              innerThumbRadius: _thumbVisible ? 5 : 0,
              innerThumbStrokeWidth: _thumbVisible ? 3 : 0,
              outerThumbRadius: _thumbVisible ? 5 : 0,
              outerThumbStrokeWidth: _thumbVisible ? 10 : 0,
              valueNotifier: _valueNotifier,
              interactive: _interactive,
              child: Center(
                child: ValueListenableBuilder(
                    valueListenable: _valueNotifier,
                    builder: (_, double value, __) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('${value.round()}'),
                        const Text('progress'),
                      ],
                    )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          const Text(
                            'progress: ',
                            // style:
                            //     kNotoSansBold14.copyWith(color: Colors.white),
                          ),
                          Slider(
                            min: 0.0,
                            max: 100.0,
                            value: _progress,
                            onChanged: (value) {
                              setState(() {
                                _progress = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          const Text(
                            'startAngle: ',
                            // style:
                            //     kNotoSansBold14.copyWith(color: Colors.white),
                          ),
                          Slider(
                            min: 0.0,
                            max: 360.0,
                            value: _startAngle,
                            onChanged: (value) {
                              setState(() {
                                _startAngle = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          const Text(
                            'sweepAngle: ',
                            // style:
                            //     kNotoSansBold14.copyWith(color: Colors.white),
                          ),
                          Slider(
                            min: 0.0,
                            max: 360.0,
                            value: _sweepAngle,
                            onChanged: (value) {
                              setState(() {
                                _sweepAngle = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          const Text(
                            'dashWidth: ',
                            // style:
                            //     kNotoSansBold14.copyWith(color: Colors.white),
                          ),
                          Slider(
                            min: 0.0,
                            max: 40.0,
                            value: _dashWidth,
                            onChanged: (value) {
                              setState(() {
                                _dashWidth = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          const Text(
                            'dashGap: ',
                            // style:
                            //     kNotoSansBold14.copyWith(color: Colors.white),
                          ),
                          Slider(
                            min: 0.0,
                            max: 10.0,
                            value: _dashGap,
                            onChanged: (value) {
                              setState(() {
                                _dashGap = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          const Text(
                            'barWidth: ',
                            // style:
                            //     kNotoSansBold14.copyWith(color: Colors.white),
                          ),
                          Slider(
                            min: 1.0,
                            max: 10,
                            value: _barWidth,
                            onChanged: (value) {
                              setState(() {
                                _barWidth = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          const Text(
                            'useGradient: ',
                            // style:
                            //     kNotoSansBold14.copyWith(color: Colors.white),
                          ),
                          Switch(
                              value: _useGradient,
                              onChanged: (value) {
                                setState(() {
                                  _useGradient = value;
                                });
                              }),
                          const Text(
                            'rounded: ',
                            // style:
                            //     kNotoSansBold14.copyWith(color: Colors.white),
                          ),
                          Switch(
                              value: _rounded,
                              onChanged: (value) {
                                setState(() {
                                  _rounded = value;
                                });
                              }),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          const Text(
                            'animation: ',
                            // style:
                            //     kNotoSansBold14.copyWith(color: Colors.white),
                          ),
                          Switch(
                              value: _animation,
                              onChanged: (value) {
                                setState(() {
                                  _animation = value;
                                });
                              }),
                          const Text(
                            'thumbVisible: ',
                            // style:
                            //     kNotoSansBold14.copyWith(color: Colors.white),
                          ),
                          Switch(
                              value: _thumbVisible,
                              onChanged: (value) {
                                setState(() {
                                  _thumbVisible = value;
                                });
                              }),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          const Text(
                            'interactive: ',
                            // style:
                            //     kNotoSansBold14.copyWith(color: Colors.white),
                          ),
                          Switch(
                              value: _interactive,
                              onChanged: (value) {
                                setState(() {
                                  _interactive = value;
                                });
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}