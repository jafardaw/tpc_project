import 'package:flutter/material.dart';
import 'package:tcp/featuer/row_materials/add_row_materials/presentation/view/widget/add_row_materials_body.dart';
import 'package:tcp/featuer/row_materials/add_row_materials/presentation/view/widget/date_picker.dart';
import 'package:tcp/featuer/row_materials/add_row_materials/presentation/view/widget/build_select_payment.dart';

class AddRowMaterials extends StatelessWidget {
  const AddRowMaterials({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('إضافة مادة خام',
      //       style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      //   centerTitle: true,
      //   backgroundColor: MyAppColors.kPrimary,
      //   elevation: 0,
      //   iconTheme: const IconThemeData(color: Colors.white),
      // ),
      body: AddRowMaterialsBody(),
    );
  }
}
