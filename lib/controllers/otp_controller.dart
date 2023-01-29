import 'package:get/get.dart';
import 'package:healthcare_system/pages/profile_page.dart';
import 'package:healthcare_system/services/authclass.dart';

class OTPController extends GetxController {
  static OTPController get instance => Get.find();

  void verifyOTP(String otp) async {
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    isVerified ? Get.offAll(const ProfilePage()) : Get.back();
  }
}
