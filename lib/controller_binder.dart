import 'package:craft_bay/core/services/network/network_client.dart';
import 'package:craft_bay/features/auth/ui/controller/sign_up_controller.dart';
import 'package:craft_bay/features/auth/ui/controller/verificatin_timer_controller.dart';
import 'package:craft_bay/features/auth/ui/controller/verification_controller.dart';
import 'package:craft_bay/features/auth/ui/screens/login_screen.dart';
import 'package:craft_bay/features/common/controller/auth_controller.dart';
import 'package:craft_bay/features/common/controller/category_list_controller.dart';
import 'package:craft_bay/features/common/controller/main_bottom_nav_controller.dart';
import 'package:craft_bay/features/home/ui/controller/home_slider_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
    Get.put(VerificationTimerController());
    Get.put(SignUpController());
    Get.put(VerificationController());
    Get.put(AuthController());
    Get.put(HomeSliderController());
    Get.put(CategoryListController());
    Get.put(
      NetworkClient(
        commonHeaders: _commonHeaders(),
        onUnAuthorize: _onUnAuthorize,
      ),
    );
  }

  Future<void> _onUnAuthorize() async {
    await Get.find<AuthController>().clearUserData();
    Get.to(() => LoginScreen());
  }

  Map<String, String> _commonHeaders() {
    return {
      'content-type': 'application/json',
      'token': Get
          .find<AuthController>()
          .accessToken ?? '',
    };
  }
}
