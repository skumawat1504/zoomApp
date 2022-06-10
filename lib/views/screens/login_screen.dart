import 'package:flutter/material.dart';
import 'package:zoom_app/controllers/auth_controller.dart';
import 'package:zoom_app/views/screens/home_screen.dart';
import 'package:zoom_app/views/screens/widgets/custom_button.dart';
import 'package:zoom_app/views/screens/widgets/dimensions.dart';

class LOginPage extends StatelessWidget {
  final AuthController _authController = AuthController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Start or Join a Meeting",
            style: TextStyle(
                fontSize: Dimensions.font24, fontWeight: FontWeight.bold),
          ),
          Container(
              child: Padding(
            padding: EdgeInsets.only(
                top: Dimensions.height16,
                bottom: Dimensions.height16,
                left: Dimensions.width18,
                right: Dimensions.width18),
            child: Image.asset(
              "assets/images/meeting.webp",
            ),
          )),
          CustomButton("Login", () {
            _authController.signInWithGoogle();
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext context) {
              return HomeScreen();
            }));
          })
        ],
      ),
    );
  }
}
