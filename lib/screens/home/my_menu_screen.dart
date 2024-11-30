import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newapp/configs/themes/app_colors.dart';
import 'package:newapp/reposotory/auth_reposotory/authentication_reposotory.dart';

import '../../controllers/theme_controller.dart';
import '../../controllers/zoom_drawer_controller.dart';

class MyMenueScreen extends GetView<MyZoomDrawerController> {
   MyMenueScreen({super.key});
  buildLanguageDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            title: Text('chooselange'.tr),
            content: SizedBox(
              width: double.maxFinite,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        child: Text(locale[index]['name']),
                        onTap: () {
                          updateLanguage(locale[index]['locale']);
                        },
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Theme.of(context).primaryColor,
                    );
                  },
                  itemCount: locale.length),
            ),
          );
        });
  }
  final List locale = [
    {'name': 'ENGLISH', 'locale': const Locale('en', 'US')},
    {'name': 'عربي', 'locale': const Locale('ar', 'EG')},
  ];
  updateLanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }

  @override
  Widget build(BuildContext context) {
    Get.put(ThemeController());
    return Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(gradient: mainGradient()),
        child: Theme(
          data: ThemeData(
            textButtonTheme: TextButtonThemeData(
                style:
                    TextButton.styleFrom(foregroundColor: onSurfaceTextColor)),
          ),
          child: SafeArea(
            child: Stack(
              children: [
                
                Positioned(
                  top: 0,
                  right: 0,
                  child: BackButton(
                    color: Colors.white,
                    onPressed: (() {
                      controller.toogleDrawer();
                    }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 100,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                         GetBuilder<ThemeController>(
                        builder: (controller) => Padding(
                          padding: const EdgeInsets.only(left: 0),
                          child: _DrawerButton(
                              icon: controller.isDarkMode
                                  ? Icons.light_mode
                                  : Icons.dark_mode,
                              label:controller.isDarkMode
                                  ? "light".tr:"dark".tr,
                              onPressed: () => controller.toggleDarkMode()),
                        ),
                      ),
                      _DrawerButton(
                          icon: Icons.facebook,
                          label: 'facebook'.tr,
                          onPressed: () => controller.facebook()),
                      Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: _DrawerButton(
                            icon: Icons.email,
                            label: "email".tr,
                            onPressed: () => controller.email()),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: _DrawerButton(
                            icon: Icons.watch,
                            label: "watsapp".tr,
                            onPressed: () => controller.phone()),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: _DrawerButton(
                            icon: Icons.language_outlined,
                            label: "changelange".tr,
                            onPressed: () { buildLanguageDialog(context);}),
                      ),

_DrawerButton(
                          icon: Icons.logout,
                          label: "logout".tr,
                          onPressed: () => Get.find<AuthenticationReposotory>().logout()),
                   
                      
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class _DrawerButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const _DrawerButton(
      {required this.icon, required this.label, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: 15,
      ),
      label: Text(label),
    );
  }
}
