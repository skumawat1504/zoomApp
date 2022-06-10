import 'package:flutter/material.dart';
import 'package:zoom_app/views/screens/widgets/custom_button.dart';
import 'package:zoom_app/views/screens/widgets/dimensions.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Forgot Pssword",
                style:
                    TextStyle(fontSize: Dimensions.font35, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
