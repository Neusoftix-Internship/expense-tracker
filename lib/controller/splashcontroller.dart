import 'package:get/get.dart';
import 'package:project_structure/view/screens/onboarding/onboarding.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() {
    Future.delayed(Duration(seconds: 3), () {
      Get.offAll(() => Onboarding());
    });
  }
}
