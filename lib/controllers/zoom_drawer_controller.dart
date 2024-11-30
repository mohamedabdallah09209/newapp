import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../screens/login/login_screen.dart';

class MyZoomDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();

  void toogleDrawer() {
    zoomDrawerController.toggle?.call();
    update();
  }

 
  void signIn() {
    Get.toNamed(LoginScreen.routeName);
  }

  void website() {
    _launch("https://google.com");
  }

  void facebook() {
    _launch("https://facebook.com");
  }

   void phone() {
    _launch("0996992624");
  }
  

  void email() {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'ebnabdallahprogrammer@gmail.com',
    );
    _launch(emailLaunchUri.toString());
  }

  Future<void> _launch(String url) async {
    // ignore: deprecated_member_use
    if (!await launch(url)) {
      throw 'could not launch $url';
    }
  }
}
