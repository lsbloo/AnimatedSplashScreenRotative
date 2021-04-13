import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';

import 'package:flutter/material.dart';

class SplashScreenRotative extends StatefulWidget {
  final timeDuration;
  final imageCenter;
  final timeTween;
  final Function(bool) onFinish;
  final Function(bool) onStopSubCenter;
  final subCenter;
  final colorBackGround;

  SplashScreenRotative(
      {@required this.timeTween,
      @required this.timeDuration,
      @required this.imageCenter,
      this.onFinish,
      this.subCenter,
      this.onStopSubCenter,
      this.colorBackGround
      });

  @override
  _SplashScreenRotativeState createState() => _SplashScreenRotativeState();
}

class _SplashScreenRotativeState extends State<SplashScreenRotative>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: widget.timeDuration))
      ..addListener(() {
        setState(() {});
      });
    _controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      left: true,
      right: true,
      top: true,
      bottom: true,
      child: Container(
        color: widget.colorBackGround,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: TweenAnimationBuilder(
                onEnd: () {
                  widget.onFinish(true);
                },
                duration: Duration(milliseconds: widget.timeDuration),
                tween: Tween<double>(begin: 0, end: widget.timeTween * pi),
                builder: (_, double angle, __) {
                  return Transform.rotate(
                      angle: angle, child: widget.imageCenter);
                },
              ),
            ),
            widget.subCenter != null
                ? Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                  child: AnimatedTextKit(
              onFinished: () {
              },
              animatedTexts: [
              RotateAnimatedText(
                      widget.subCenter,
                      textStyle: const TextStyle(fontSize: 32.0, fontWeight: FontWeight.normal, decoration:
                      TextDecoration.none, color: Colors.white)
                    )
            ],totalRepeatCount: 1, pause: Duration(milliseconds: widget.timeDuration), displayFullTextOnTap: false,
                  stopPauseOnTap: false, ),
                )
                : Container()
          ],
        ),
      ),
    );
  }
}
