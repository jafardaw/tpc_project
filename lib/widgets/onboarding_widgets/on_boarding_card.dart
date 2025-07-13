import 'package:flutter/material.dart';
import 'package:tcp/constants/on_boarding.dart';
import 'package:lottie/lottie.dart';

class OnBoardingCard extends StatefulWidget {
  OnBoarding onBoardingModel;
  OnBoardingCard({
    super.key,
    required this.onBoardingModel,
  });

  @override
  State<OnBoardingCard> createState() => _OnBoardingCardState();
}

class _OnBoardingCardState extends State<OnBoardingCard> {
  @override
  Widget build(BuildContext context) {
    return Lottie.asset(widget.onBoardingModel.image);
  }
}
