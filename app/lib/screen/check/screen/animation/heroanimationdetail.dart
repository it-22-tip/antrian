import 'package:flutter/material.dart';
import 'package:xfocus_mobile/components/app_bar/primary_app_bar.dart';

class HeroanimationdetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(primaryAppBarTitle: 'Cross Animation Detail'),
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: 'imageHero',
            child: Container(
              width: 200.0,
              height: 200.0,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/png/logo-50.png',
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
