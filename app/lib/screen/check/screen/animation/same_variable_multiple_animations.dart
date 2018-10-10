import 'dart:async';

import 'package:flutter/material.dart';
import 'package:xfocus_mobile/components/app_bar/primary_app_bar.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';

class SameVariableAnimationPage extends StatefulWidget {
  @override
  _SameVariableAnimationPageState createState() =>
      _SameVariableAnimationPageState();
}

class _SameVariableAnimationPageState extends State<SameVariableAnimationPage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  SequenceAnimation sequenceAnimation;

  bool forward;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));

    sequenceAnimation = SequenceAnimationBuilder()
        .addAnimatable(
            animatable: ColorTween(begin: Colors.red, end: Colors.yellow),
            from: const Duration(seconds: 0),
            to: const Duration(seconds: 4),
            tag: "color")
        .addAnimatable(
            animatable: Tween<double>(begin: 50.0, end: 300.0),
            from: const Duration(seconds: 0),
            to: const Duration(milliseconds: 3000),
            tag: "width",
            curve: Curves.easeIn)
        .addAnimatable(
            animatable: Tween<double>(begin: 300.0, end: 100.0),
            from: const Duration(milliseconds: 3000),
            to: const Duration(milliseconds: 3700),
            tag: "width",
            curve: Curves.decelerate)
        .addAnimatable(
            animatable: Tween<double>(begin: 50.0, end: 300.0),
            from: const Duration(seconds: 0),
            to: const Duration(milliseconds: 3000),
            tag: "height",
            curve: Curves.ease)
        .addAnimatable(
            animatable: Tween<double>(begin: 300.0, end: 450.0),
            from: const Duration(milliseconds: 3000),
            to: const Duration(milliseconds: 3800),
            tag: "height",
            curve: Curves.decelerate)
        .animate(controller);
  }

  Future<Null> _playAnimation() async {
    try {
      await controller.forward().orCancel;
      await controller.reverse().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because we were disposed
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        primaryAppBarTitle: 'Same Variable'
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          _playAnimation();
        },
        child: AnimatedBuilder(
          builder: (context, child) {
            return Center(
              child: Container(
                color: sequenceAnimation["color"].value,
                height: sequenceAnimation["height"].value,
                width: sequenceAnimation["width"].value,
              ),
            );
          },
          animation: controller,
        ),
      ),
    );
  }
}
