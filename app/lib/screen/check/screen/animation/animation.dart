import 'package:flutter/material.dart';
import 'package:xfocus_mobile/animations/slide_right_route.dart';
import 'same_variable_multiple_animations.dart';
import 'sequence_page.dart';
import 'staggered_animation_replication.dart';
import 'heroanimation.dart';
import 'package:xfocus_mobile/components/app_bar/primary_app_bar.dart';

class AnimationScreen extends StatefulWidget {
  @override
  _AnimationScreenState createState() =>
      _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {
  void _goToScreen(context, Widget screen) {
    Navigator.push(
      context,
      SlideRightRoute(
        widget: screen,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PrimaryAppBar(primaryAppBarTitle: 'Anim'),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () => _goToScreen(context, SequencePage()),
                child: Text("Sequence"),
              ),
              RaisedButton(
                onPressed: () =>
                    _goToScreen(context, StaggeredAnimationReplication()),
                child: Text("StaggeredAnimationReplication"),
              ),
              RaisedButton(
                onPressed: () =>
                    _goToScreen(context, SameVariableAnimationPage()),
                child: Text("SameVariableAnimationPage"),
              ),
              RaisedButton(
                onPressed: () =>
                    _goToScreen(context, HeroanimationScreen()),
                child: Text("Hero Animation"),
              ),
            ],
          ),
        ));
  }
}
