// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  Function()? onPressed;
  final String buttonName;
  final MaterialStateProperty<Color?>? colorButton;
  final Color? textButtonColor;
  final IconData? iconButton;
  CustomButton({
    Key? key,
    required this.onPressed,
    required this.buttonName,
    this.colorButton,
    this.textButtonColor,
    this.iconButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        height: 50,
        child: ElevatedButton(
            onPressed: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  iconButton,
                  color: textButtonColor,
                  size: 25,
                ),
                SizedBox(width: 20),
                Text(
                  buttonName,
                  style: TextStyle(fontSize: 16, color: textButtonColor),
                ),
              ],
            ),
            style: ButtonStyle(
                backgroundColor: colorButton,
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))))));
  }
}
