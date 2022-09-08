import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_study_app/config/themes/app_dark_theme.dart';
import 'package:firebase_study_app/config/themes/app_light_theme.dart';
import 'package:firebase_study_app/controllers/theme_controller.dart';
import 'package:firebase_study_app/firebase_options.dart';
import 'package:firebase_study_app/routes/app_routes.dart';
import 'package:firebase_study_app/screens/data_uploader_screen.dart';
import 'package:firebase_study_app/screens/introduction/introduction.dart';
import 'package:firebase_study_app/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_study_app/bindings/initial_bindings.dart';
import 'package:firebase_core/firebase_core.dart';


// we just written this code to upload data to firebase
// Future<void> main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   runApp(GetMaterialApp(home: DataUploaderScreen(),));
// }

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  InitialBindings().dependencies();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Get.find<ThemeController>().lightTheme,
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.routes(),
    );
  }
}
