// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextFormRegister extends StatelessWidget {
  String labelText;
  TextEditingController? controller;
  String? Function(String?)? validator;
  bool? obscureText;
  IconData? prefixIcon;
  CustomTextFormRegister(
      {Key? key,
      required this.labelText,
      this.controller,
      this.validator,
      this.obscureText,
      this.prefixIcon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.only(right: 25, left: 20),
          child: Icon(
            prefixIcon,
            color: Color(0xFF808080),
          ),
        ),
        filled: true,
        fillColor: Color(0xFFDCDCDC),
        labelText: labelText,
        labelStyle: TextStyle(
            fontSize: 16,
            color: Color(0xFF808080),
            fontWeight: FontWeight.w600),
        floatingLabelStyle: TextStyle(
            fontSize: 16,
            color: Color(0xFF808080),
            fontWeight: FontWeight.w600),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Color(0xFFDCDCDC), width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Color(0xFFDCDCDC), width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.red, width: 3),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.red, width: 3),
        ),
      ),
      style: TextStyle(color: Color(0xFF808080), fontWeight: FontWeight.w600),
      cursorColor: Color(0xFF808080),
      obscureText: obscureText ?? false,
    );
  }
}
