// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomButtonRegister extends StatelessWidget {
  Function()? onPressed;
  final String buttonName;
  final MaterialStateProperty<Color?>? colorButton;
  final Color? textButtonColor;
  final IconData? iconButton;
  final double widthButton;
  final double heigthButton;
  CustomButtonRegister({
    Key? key,
    required this.onPressed,
    required this.buttonName,
    this.colorButton,
    this.textButtonColor,
    this.iconButton, required this.widthButton, required this.heigthButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: widthButton,
        height: heigthButton,
        child: ElevatedButton(
            onPressed: onPressed,
            child: Text(
              buttonName,
              style: TextStyle(fontSize: 16, color: textButtonColor),
            ),
            style: ButtonStyle(
                backgroundColor: colorButton,
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))))));
  }
}
