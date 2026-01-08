import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme/colors.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return           Stack(
      children: [
        Image.asset(
          "assets/images/Hero.png",
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          height: 336,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  AppColors.mainColor.withOpacity(.33),
                  AppColors.mainColor,
                ],
              ),
            ),
          ),
        ),
      ],
    )
    ;
  }
}
