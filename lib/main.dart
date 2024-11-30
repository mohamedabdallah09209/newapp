import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newapp/bindings/initial_bindings.dart';
import 'package:newapp/controllers/theme_controller.dart';
import 'package:newapp/reposotory/auth_reposotory/authentication_reposotory.dart';
import 'langueges/app_translations.dart';
import 'package:firebase_core/firebase_core.dart';

import 'routes/app_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
   InitialBindings().dependencies();
  await Firebase.initializeApp(
     options: const FirebaseOptions(
       apiKey: 'AIzaSyBZawAiRqKGMmEI0rw4qGiClQ8n8487GmU',
       appId: '1:677830672410:android:0ee44c6b1e341cd86c11a3',
       messagingSenderId: '677830672410',
       projectId: 'newapp-4b3ae',
     ),
  ).then((value) => Get.put(AuthenticationReposotory()));
 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ThemeController());
    return GetBuilder<ThemeController>(
      builder: (controller)=>GetMaterialApp(
      title: 'apptitle'.tr,
      translations: AppTranslations(),
      locale: const Locale('ar', 'EG'),
      debugShowCheckedModeBanner: false,
      theme: controller.appTheme,
      getPages: AppRoutes.routes(),),
    );
  }
}
