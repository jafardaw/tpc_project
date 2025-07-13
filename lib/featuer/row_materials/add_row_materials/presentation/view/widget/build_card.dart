import 'package:flutter/material.dart';
import 'package:tcp/constants/my_app_colors.dart';

Widget buildFieldCard({required Widget child, IconData? icon}) {
  return Card(
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    color: MyAppColors.kWhite,
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (icon != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Icon(
                icon,
                color: MyAppColors.kPrimary,
                size: 28,
              ),
            ),
          child,
        ],
      ),
    ),
  );
}
