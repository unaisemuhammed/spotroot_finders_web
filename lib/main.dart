import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotrootweb/services/locator.dart';
import 'package:spotrootweb/view/Home_Screen.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
    
  // );
  runApp(const MyApp());
  //serviceLocator();
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