import 'package:flutter/material.dart';
import 'package:tcp/core/util/images_gen.dart';
import 'package:tcp/featuer/home/presentation/view/widget/build_properties_container.dart';
import 'package:tcp/featuer/home/presentation/view/widget/card_row_materials.dart';
import 'package:tcp/featuer/home/presentation/view/widget/slider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> sliderImages = [
      Assets.imagesLogoTPC,
      Assets.imagesLogo2,
      Assets.imagesOnBoarding2,
      Assets.imagesOnboarding1,
      Assets.imagesOnboarding1,
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomImageSlider(
              imageList: sliderImages,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                      child: BirthdayCard(
                    tite: 'مواد مستخدمة',
                    iconData: Icons.check_circle,
                    listColor: [
                      Color(0xFF1976D2),
                      Color(0xFF64B5F6),
                    ],
                  )),
                  const SizedBox(width: 20),
                  Expanded(
                      child: BirthdayCard(
                    tite: 'مواد غير مستخدمة',
                    iconData: Icons.cancel,
                    listColor: [
                      Color.fromARGB(255, 244, 139, 54),
                      Color(0xFFE57373)
                    ],
                  ))
                  // _buildMaterialCard('غير مستخدمة', 8, Colors.orange)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            buildPropertiesContainer(),
          ],
        ),
      ),
    );
  }
}
