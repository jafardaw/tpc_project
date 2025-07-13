import 'package:flutter/material.dart';
import 'package:tcp/constants/my_app_colors.dart';

class CustomTextField extends StatefulWidget {
  final String? hint;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final bool obscureText;
  final Text? label;
  final TextStyle? hintStyle;
  final TextEditingController? controller;
  final int? maxLength;
  final TextStyle? labelStyle;
  final TextStyle? floatingLabelStyle;
  final int maxLines;
  final String? Function(String?)? validator;
  final bool readOnly;
  final bool? isDense;
  final String? labelText;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final Widget? suffix;
  final void Function()? onTap;

  const CustomTextField({
    super.key,
    this.hint,
    this.onChanged,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.obscureText = false,
    this.label,
    this.hintStyle,
    this.controller,
    this.maxLength,
    this.labelStyle,
    this.floatingLabelStyle,
    this.maxLines = 1,
    this.validator,
    this.readOnly = false,
    this.isDense,
    this.labelText,
    this.floatingLabelBehavior,
    this.suffix,
    this.onTap,
  });

  @override
  CustomTextFieldState createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double horizontalPadding = screenSize.width * 0.04;
    final double textSize = screenSize.width < 600 ? 14 : 16;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: TextFormField(
        onTap: widget.onTap,
        readOnly: widget.readOnly,
        maxLines: widget.maxLines,
        maxLength: widget.maxLength,
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        obscureText: _showPassword ? false : widget.obscureText,
        validator: widget.validator,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          floatingLabelBehavior: widget.floatingLabelBehavior,
          errorStyle: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          isDense: widget.isDense,
          suffixIcon: widget.obscureText
              ? IconButton(
                  icon: Icon(
                    _showPassword ? Icons.visibility : Icons.visibility_off,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      _showPassword = !_showPassword;
                    });
                  },
                )
              : widget.suffixIcon,
          label: widget.label,
          floatingLabelStyle: widget.floatingLabelStyle,
          labelStyle: widget.labelStyle,
          prefixIcon: widget.prefixIcon,
          hintText: widget.hintText,
          hintStyle: widget.hintStyle?.copyWith(fontSize: textSize) ??
              TextStyle(fontSize: textSize),
          fillColor: Colors.white,
          filled: true,
          enabledBorder: buildBorder(),
          border: buildBorder(),
          focusedBorder: buildBorder(MyAppColors.kPrimary),
          suffix: widget.suffix,
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder([Color? color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color ?? MyAppColors.kPrimary),
    );
  }
}
