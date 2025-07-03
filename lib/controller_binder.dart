import 'package:craft_bay/core/services/network/network_client.dart';
import 'package:craft_bay/features/auth/ui/controller/sign_up_controller.dart';
import 'package:craft_bay/features/auth/ui/controller/verificatin_timer_controller.dart';
import 'package:craft_bay/features/auth/ui/controller/verification_controller.dart';
import 'package:craft_bay/features/common/controller/main_bottom_nav_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
    Get.put(VerificationTimerController());
    Get.put(SignUpController());
    Get.put(VerificationController());
    Get.put(
      NetworkClient(
        commonHeaders: _commonHeaders,
        onUnAuthorize: _onUnAuthorize,
      ),
    );
  }

  void _onUnAuthorize() {
    //ToDo:Logout
  }

  final Map<String, String> _commonHeaders = {
    'content-type': 'application/json',
    'token': '',
  };
}
