import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:tcp/constants/my_app_colors.dart';
import 'package:tcp/core/util/images_gen.dart';
import 'package:tcp/core/util/style.dart';
import 'package:tcp/core/util/widget/custom_botton.dart';

class RowMaterialsDetailsView extends StatelessWidget {
  const RowMaterialsDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyAppColors.kWhite,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Ionicons.heart_outline, color: MyAppColors.kPrimary),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Ionicons.share_social_outline,
                color: MyAppColors.kPrimary),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .3,
            padding: EdgeInsets.only(bottom: 30),
            child: Hero(
              tag: 'product-image',
              child: Image.asset(
                Assets.imagesLogoTPCRemovebgPreview,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 30, right: 20, left: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Chanel',
                          style: AppTextStyles.calibri13ItalicGrey600,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Text(
                            ' Chanel No. 5 - 100 ',
                            style: AppTextStyles.calibri24BoldPrimary,
                          ),
                        ),
                        Text(
                          '\$135.00',
                          style: AppTextStyles.calibri24BoldPrimary,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'الوصف:',
                      style: AppTextStyles.calibri16BoldWhite
                          .copyWith(color: MyAppColors.kPrimary),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'عطر Chanel No. 5 هو أحد أشهر العطور في العالم، يتميز برائحة زهرية-ألدهيدية أنثوية. يحتوي على خلطة من زيت الياسمين والورد مع لمسات من الفانيليا والمسك.',
                      style: AppTextStyles.openSans12SemiBoldGrey600,
                    ),

                    SizedBox(height: 20),

                    // معلومات إضافية
                    _buildInfoRow(
                        Ionicons.time_outline, 'مدة الصلاحية', '36 شهر'),
                    _buildInfoRow(
                        Ionicons.cube_outline, 'حجم العبوة', '100 مل'),
                    _buildInfoRow(
                        Ionicons.earth_outline, 'بلد المنشأ', 'فرنسا'),

                    SizedBox(height: 25),

                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            text: 'تعديل المنتج',
                            onTap: () {},
                          ),
                        ),
                        SizedBox(width: 15),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: MyAppColors.kPrimary),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: IconButton(
                            icon: Icon(Ionicons.trash,
                                color: MyAppColors.kPrimary, size: 24),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20),

                    Text(
                      'منتجات مشابهة',
                      style: AppTextStyles.calibri12LightGrey500,
                    ),
                    SizedBox(height: 15),

                    _buildSimilarProduct(
                        context, 'Chanel Coco Mademoiselle', '\$120.00'),
                    _buildSimilarProduct(context, 'Dior J\'adore', '\$110.00'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: MyAppColors.kPrimary, size: 22),
          SizedBox(width: 10),
          Text(
            '$title: ',
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.grey[700],
            ),
          ),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: MyAppColors.kPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSimilarProduct(BuildContext context, String name, String price) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(Assets.imagesLogo2),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  price,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: MyAppColors.kPrimary,
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 18),
        ],
      ),
    );
  }
}
