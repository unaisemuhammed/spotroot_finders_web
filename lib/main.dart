import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotrootweb/services/locator.dart';
import 'package:spotrootweb/view/AuthScreens/loginScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:spotrootweb/view/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyAjaYid4qalqFnu7KZ2LvMS-54aCVwom_o",
    appId: "1:927646899468:web:110a121c87ee0d565ffd29",
    messagingSenderId: "927646899468",
    databaseURL:
        'https://spotrootpartner-default-rtdb.firebaseio.com', // IMPORTANT!
    projectId: "spotrootpartner",
  ));
  serviceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Spot Root Partner',
          theme: ThemeData(
            // colorScheme: ColorScheme.fromSeed(
            //     seedColor: Color.fromARGB(255, 255, 0, 0)),
            useMaterial3: true,
          ),
          home: const HomeScreen());
    });
  }
}
