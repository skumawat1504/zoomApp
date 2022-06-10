import 'package:flutter/material.dart';
import 'package:zoom_app/utils/colors.dart';
import 'package:zoom_app/views/screens/widgets/dimensions.dart';

class MeetingOptions extends StatelessWidget {
  final String text;
  final bool isMuted;
  final Function(bool) onChange;
  const MeetingOptions(
      {Key? key,
      required this.text,
      required this.isMuted,
      required this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height60,
      color: secondaryBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.width10, vertical: Dimensions.height10),
            child: Text(
              text,
              style: TextStyle(fontSize: Dimensions.font16),
            ),
          ),
          Switch(value: isMuted, onChanged: onChange)
        ],
      ),
    );
  }
}
