import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tcp/core/util/images_gen.dart';

class SplashImageLoader extends StatelessWidget {
  const SplashImageLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          Assets.imagesLogo2,
          width: 45.w,
          height: 45.w,
        )
            .animate(
              onPlay: (controller) => controller.repeat(), // تكرار مستمر
            )
            .rotate(
              duration: 10.seconds,
              begin: 0,
              end: 2.9,
              curve: Curves.linear, // لتفادي التقطيع
            )
            .fadeIn(duration: 800.ms),
      ),
    );
  }
}
