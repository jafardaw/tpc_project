import 'package:flutter/widgets.dart';
import 'package:tcp/core/util/images_gen.dart';

class ClipRRectWiget extends StatelessWidget {
  const ClipRRectWiget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Image.asset(
        Assets.imagesLogo2RemovebgPreview, // Replace with your logo path
        width: 80,
        height: 80,
        fit: BoxFit.contain,
      ),
    );
  }
}
