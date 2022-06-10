import 'package:flutter/material.dart';
import 'package:zoom_app/utils/colors.dart';
import 'package:zoom_app/views/screens/widgets/dimensions.dart';

class ReusableIconWidget extends StatelessWidget {
  final IconData? icon;
  final String text;
  final VoidCallback onPressed;
  const ReusableIconWidget(
      {Key? key,
      required this.icon,
      required this.text,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
            decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.black.withOpacity(0.7),
                  )
                ]),
            height: Dimensions.height60,
            width: Dimensions.width60,
            child: Icon(
              icon,
              size: Dimensions.height30,
            ),
          ),
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        Text(
          text,
          style: TextStyle(color: Colors.grey, fontSize: Dimensions.font16),
        )
      ],
    );
  }
}
