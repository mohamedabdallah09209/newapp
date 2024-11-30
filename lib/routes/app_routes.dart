import 'package:get/get.dart';
import 'package:newapp/screens/home/home_screen.dart';
import 'package:newapp/screens/login/login_screen.dart';
import 'package:newapp/screens/signup/signup_screen.dart';
import '../controllers/zoom_drawer_controller.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(
          name: "/",
          page: () =>  LoginScreen(),
        ),
        GetPage(
          name: SignupScreen.routeName,
          page: () => const SignupScreen(),
        ),
         GetPage(
          name: LoginScreen.routeName,
          page: () => const LoginScreen(),
        ),
        GetPage(
          name: "/home",
          page: () => const HomeScreen(),
           binding: BindingsBuilder(
            () {
              
              Get.put(
                MyZoomDrawerController(),
              );
            },
          ),
        ),
      ];
}
