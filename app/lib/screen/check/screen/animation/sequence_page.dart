import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';
import 'package:xfocus_mobile/components/app_bar/primary_app_bar.dart';

class SequencePage extends StatefulWidget {
  @override
  _SequencePageState createState() => _SequencePageState();
}

class _SequencePageState extends State<SequencePage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  SequenceAnimation sequenceAnimation;

  bool forward;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this);

    sequenceAnimation = SequenceAnimationBuilder()
        .addAnimatable(
            animatable: ColorTween(begin: Colors.red, end: Colors.yellow),
            from: const Duration(seconds: 0),
            to: const Duration(seconds: 2),
            tag: "color")
        .addAnimatable(
            animatable:
                ColorTween(begin: Colors.yellow, end: Colors.blueAccent),
            from: const Duration(seconds: 2),
            to: const Duration(seconds: 4),
            tag: "color",
            curve: Curves.easeOut)
        .addAnimatable(
            animatable: ColorTween(begin: Colors.blueAccent, end: Colors.pink),
            //  animatable: Tween<double>(begin: 200.0, end: 40.0),
            from: const Duration(seconds: 5),
            to: const Duration(seconds: 6),
            tag: "color",
            curve: Curves.fastOutSlowIn)
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
        primaryAppBarTitle: 'Sequence',
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
                height: 200.0,
                width: 200.0,
              ),
            );
          },
          animation: controller,
        ),
      ),
    );
  }
}
