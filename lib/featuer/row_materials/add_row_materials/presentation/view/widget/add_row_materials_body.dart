import 'package:flutter/material.dart';
import 'package:tcp/constants/my_app_colors.dart';
import 'package:tcp/core/util/function/linear_gradient.dart';
import 'package:tcp/core/util/function/validate.dart';
import 'package:tcp/core/util/style.dart';
import 'package:tcp/core/util/widget/custom_botton.dart';
import 'package:tcp/core/util/widget/custom_text_field.dart';
import 'package:tcp/featuer/row_materials/add_row_materials/presentation/view/widget/build_card.dart';
import 'package:tcp/featuer/row_materials/add_row_materials/presentation/view/widget/build_select_payment.dart';
import 'package:tcp/featuer/row_materials/add_row_materials/presentation/view/widget/clip_r_rict_widget.dart';
import 'package:tcp/featuer/row_materials/add_row_materials/presentation/view/widget/date_picker.dart';

class AddRowMaterialsBody extends StatefulWidget {
  const AddRowMaterialsBody({super.key});

  @override
  AddRowMaterialsBodyState createState() => AddRowMaterialsBodyState();
}

class AddRowMaterialsBodyState extends State<AddRowMaterialsBody> {
  final _formKey = GlobalKey<FormState>();
  bool _isUsed = false;
  String? selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: linearGradient(),
        ),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              children: [
                // Logo Section with Beautiful Design
                Container(
                  margin: const EdgeInsets.only(bottom: 24, top: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: MyAppColors.kPrimary.withValues(alpha: 0.2),
                        blurRadius: 15,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: ClipRRectWiget(),
                ),

                Text('إضافة مادة خام جديدة',
                    style: AppTextStyles.calibri22Splach),
                const SizedBox(height: 16),

                buildFieldCard(
                  icon: Icons.inventory_2_outlined,
                  child: SwitchListTile(
                    title: Text('حالة المادة',
                        style: TextStyle(
                            color: MyAppColors.kPrimary,
                            fontWeight: FontWeight.bold)),
                    subtitle: Text(_isUsed ? 'مستخدمة' : 'غير مستخدمة',
                        style: TextStyle(
                            color: _isUsed ? Colors.green : Colors.orange,
                            fontWeight: FontWeight.w600)),
                    activeColor: Colors.green,
                    inactiveThumbColor: Colors.orange,
                    contentPadding: EdgeInsets.zero,
                    secondary: Icon(
                      _isUsed ? Icons.check_circle : Icons.pending,
                      color: _isUsed ? Colors.green : Colors.orange,
                      size: 30,
                    ),
                    value: _isUsed,
                    onChanged: (value) {
                      setState(() {
                        _isUsed = value;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 20),

                buildFieldCard(
                  icon: Icons.inventory_2,
                  child: CustomTextField(
                    labelText: ' الكمية الداخلة',
                    hintText: 'أدخل الكمية الداخلة هنا',
                    keyboardType: TextInputType.number,
                    prefixIcon: Icon(Icons.input, color: MyAppColors.kPrimary),
                    validator: validateQuantity,
                  ),
                ),
                const SizedBox(height: 20),
                buildFieldCard(
                  icon: Icons.output,
                  child: CustomTextField(
                    labelText: ' الكمية الخارجة',
                    hintText: 'أدخل الكمية الخارجة هنا',
                    keyboardType: TextInputType.number,
                    prefixIcon: Icon(Icons.output, color: MyAppColors.kPrimary),
                    validator: validateQuantity,
                  ),
                ),
                const SizedBox(height: 20),
                buildFieldCard(
                  icon: Icons.warehouse,
                  child: CustomTextField(
                    labelText: ' الكمية المتبقية',
                    hintText: 'أدخل الكمية المتبقية هنا',
                    keyboardType: TextInputType.number,
                    prefixIcon:
                        Icon(Icons.inventory, color: MyAppColors.kPrimary),
                    validator: validateQuantity,
                  ),
                ),
                const SizedBox(height: 20),
                buildFieldCard(
                  icon: Icons.description,
                  child: CustomTextField(
                    labelText: ' (الوصف) البيان',
                    hintText: 'أدخل البيان هنا',
                    prefixIcon:
                        Icon(Icons.description, color: MyAppColors.kPrimary),
                    validator: validateQuantity,
                  ),
                ),
                const SizedBox(height: 20),

                buildFieldCard(
                  icon: Icons.monetization_on_outlined,
                  child: CustomTextField(
                    labelText: 'السعر',
                    hintText: 'أدخل السعر هنا',
                    keyboardType: TextInputType.number,
                    prefixIcon:
                        Icon(Icons.attach_money, color: MyAppColors.kPrimary),
                    validator: validatePrice,
                  ),
                ),
                const SizedBox(height: 20),

                buildFieldCard(
                  icon: Icons.account_balance_wallet_outlined,
                  child: CustomTextField(
                    labelText: 'التكلفة الحقيقية',
                    hintText: 'أدخل التكلفة الحقيقية هنا',
                    keyboardType: TextInputType.number,
                    prefixIcon: Icon(Icons.money_off_csred,
                        color: MyAppColors.kPrimary),
                    validator: validateRealCost,
                  ),
                ),
                const SizedBox(height: 20),
                buildFieldCard(
                    icon: Icons.date_range_outlined,
                    child: DatePickerExample()),

                const SizedBox(height: 20),
                buildFieldCard(
                  icon: Icons.payment,
                  child: CustomTextField(
                    labelText: ' طريقة  الدفع ',
                    hintText: ' طريقة  الدفع  كاش او مصارف او حركة أموال ....',
                    keyboardType: TextInputType.number,
                    prefixIcon:
                        Icon(Icons.payment, color: MyAppColors.kPrimary),
                    validator: validateRealCost,
                  ),
                  //  CustomDropdownWithSearch(
                  //   items: const [
                  //     'كاش',
                  //     'مصارف',
                  //     'حركة أموال',
                  //     'تحويل بنكي',
                  //     'بطاقة ائتمان',
                  //     'محفظة إلكترونية'
                  //   ],
                  //   hintText: 'اختر طريقة الدفع',
                  //   onSelected: (value) {
                  //     print('القيمة المحددة: $value');
                  //     setState(() {
                  //       selectedPaymentMethod = value;
                  //     });
                  //   },
                  // ),
                ),

                const SizedBox(height: 20),

                buildFieldCard(
                  icon: Icons.note,
                  child: CustomTextField(
                    maxLines: 5,
                    labelText: ' ملاحظات',
                    hintText: 'أدخل  ملاحظاتك هنا',
                    validator: validateEstimatedCost,
                  ),
                ),
                const SizedBox(height: 32),

                CustomButton(
                  text: 'إضافة المادة',
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      // Handle form submission
                    }
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
