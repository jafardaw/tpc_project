import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tcp/constants/my_app_colors.dart';
import 'package:tcp/core/util/widget/custom_text_field.dart';

class DatePickerExample extends StatefulWidget {
  const DatePickerExample({super.key});

  @override
  DatePickerExampleState createState() => DatePickerExampleState();
}

class DatePickerExampleState extends State<DatePickerExample> {
  DateTime _selectedDate = DateTime.now();
  final TextEditingController _dateController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.blue, // لون رئيسي
              onPrimary: Colors.white, // لون النص على العنصر الرئيسي
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: _dateController,
      readOnly: true,
      hintText: 'التاريخ',
      hint: 'التاريخ',
      label: Text('التاريخ'),
      onTap: () => _selectDate(context),
      prefixIcon: Icon(
        Icons.date_range_outlined,
        color: MyAppColors.kPrimary,
      ),
    );
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }
}
