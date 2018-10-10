import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';
import 'package:xfocus_mobile/components/app_bar/primary_app_bar.dart';

class StaggeredAnimationReplication extends StatefulWidget {
  @override
  _StaggeredAnimationReplicationState createState() =>
      _StaggeredAnimationReplicationState();
}

class _StaggeredAnimationReplicationState
    extends State<StaggeredAnimationReplication>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  SequenceAnimation sequenceAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this);

    sequenceAnimation = SequenceAnimationBuilder()
        .addAnimatable(
            animatable: Tween<double>(begin: 0.0, end: 1.0),
            from: Duration.zero,
            to: const Duration(milliseconds: 200),
            curve: Curves.ease,
            tag: "opacity")
        .addAnimatable(
            animatable: Tween<double>(begin: 50.0, end: 150.0),
            from: const Duration(milliseconds: 250),
            to: const Duration(milliseconds: 500),
            curve: Curves.ease,
            tag: "width")
        .addAnimatable(
            animatable: Tween<double>(begin: 50.0, end: 150.0),
            from: const Duration(milliseconds: 500),
            to: const Duration(milliseconds: 750),
            curve: Curves.ease,
            tag: "height")
        .addAnimatable(
            animatable: EdgeInsetsTween(
              begin: const EdgeInsets.only(bottom: 16.0),
              end: const EdgeInsets.only(bottom: 75.0),
            ),
            from: const Duration(milliseconds: 500),
            to: const Duration(milliseconds: 750),
            curve: Curves.ease,
            tag: "padding")
        .addAnimatable(
            animatable: BorderRadiusTween(
              begin: BorderRadius.circular(4.0),
              end: BorderRadius.circular(75.0),
            ),
            from: const Duration(milliseconds: 750),
            to: const Duration(milliseconds: 1000),
            curve: Curves.ease,
            tag: "borderRadius")
        .addAnimatable(
            animatable: ColorTween(
              begin: Colors.indigo[100],
              end: Colors.orange[400],
            ),
            from: const Duration(milliseconds: 1000),
            to: const Duration(milliseconds: 1500),
            curve: Curves.ease,
            tag: "color")
        .animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Container(
      padding: sequenceAnimation["padding"].value,
      alignment: Alignment.bottomCenter,
      child: Opacity(
        opacity: sequenceAnimation["opacity"].value,
        child: Container(
          width: sequenceAnimation["width"].value,
          height: sequenceAnimation["height"].value,
          decoration: BoxDecoration(
            color: sequenceAnimation["color"].value,
            border: Border.all(
              color: Colors.indigo[300],
              width: 3.0,
            ),
            borderRadius: sequenceAnimation["borderRadius"].value,
          ),
        ),
      ),
    );
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        primaryAppBarTitle: 'Staggered Animation',
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          _playAnimation();
        },
        child: Center(
          child: Container(
            width: 300.0,
            height: 300.0,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              border: Border.all(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            child: AnimatedBuilder(
                animation: controller, builder: _buildAnimation),
          ),
        ),
      ),
    );
  }
}
