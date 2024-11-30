import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:newapp/configs/themes/app_colors.dart';
import 'package:newapp/configs/themes/app_icons.dart';
import 'package:newapp/configs/themes/custom_text_style.dart';
import 'package:newapp/controllers/home_controller.dart';
import 'package:newapp/controllers/zoom_drawer_controller.dart';
import 'package:newapp/models/user_model.dart';
import 'package:newapp/screens/home/my_menu_screen.dart';
import 'package:newapp/widgets/app_circle_button.dart';

class HomeScreen extends GetView<MyZoomDrawerController> {
  static const String routeName = "/home";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());

    return Scaffold(body: GetBuilder<MyZoomDrawerController>(builder: (_) {
      return ZoomDrawer(
        isRtl: Get.locale == const Locale('ar', 'EG') ? true : false,
        controller: _.zoomDrawerController,
        borderRadius: 50,
        menuBackgroundColor: Theme.of(context).primaryColor,
        style: DrawerStyle.defaultStyle,
        slideWidth: MediaQuery.of(context).size.width * 0.7,
        angle: 0.0,
        menuScreen: MyMenueScreen(),
        mainScreen: Container(
          decoration: BoxDecoration(gradient: mainGradient()),
          child: SafeArea(
            child: FutureBuilder(
              future: homeController.getUserData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    UserModel userModel = snapshot.data as UserModel;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppCircleButton(
                          onTap: controller.toogleDrawer,
                          child: const Icon(
                            Icons.menu,
                            size: 30,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              const Icon(
                                AppIcons.peace,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'hellofriend'.tr,
                                style: detailText.copyWith(
                                    color: onSurfaceTextColor),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                "[[" + userModel.fullname + "]]",
                                style: detailText.copyWith(
                                    fontSize: 20, color: onSurfaceTextColor),
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else {
                    return Center(child: Text("Something wrong"));
                  }
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ),
      );
    }));
  }
}
