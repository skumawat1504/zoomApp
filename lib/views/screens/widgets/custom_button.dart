import 'package:flutter/material.dart';
import 'package:zoom_app/utils/colors.dart';
import 'package:zoom_app/views/screens/widgets/dimensions.dart';

class CustomButton extends StatelessWidget {
  String text;
  final VoidCallback onPressed;
  CustomButton(this.text, this.onPressed);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: Dimensions.height16,
          bottom: Dimensions.height16,
          left: Dimensions.width18,
          right: Dimensions.width18),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(fontSize: Dimensions.font17andHalf),
        ),
        style: ElevatedButton.styleFrom(
            primary: buttonColor,
            minimumSize: Size(double.infinity, Dimensions.height50),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))),
      ),
    );
  }
}
