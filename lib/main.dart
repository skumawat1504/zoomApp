import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:zoom_app/controllers/auth_controller.dart';
import 'package:zoom_app/utils/colors.dart';
import 'package:zoom_app/views/screens/home_screen.dart';
import 'package:zoom_app/views/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyBY-EzGdD12VUaxP7JvaPveKSumSGnntcs",
          appId: "1:336798986955:android:905b6a99fc127018e4a14e",
          messagingSenderId: "336798986955	",
          projectId: "zoom-clone-app-c9abd"));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme:
            ThemeData.dark().copyWith(scaffoldBackgroundColor: backgroundColor),
        home: StreamBuilder(
          stream: AuthController().authChanges,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasData) {
              return HomeScreen();
            }

            return LOginPage();
          },
        ));
  }
}
