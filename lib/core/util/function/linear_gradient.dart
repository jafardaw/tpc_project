import 'package:flutter/material.dart';
import 'package:tcp/constants/my_app_colors.dart';

LinearGradient linearGradient() {
  return LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Colors.white,
      MyAppColors.kPrimary.withValues(alpha: 0.1),
    ],
  );
}
