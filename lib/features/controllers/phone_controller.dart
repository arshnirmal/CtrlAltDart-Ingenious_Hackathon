import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_system/features/services/authclass.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  //TextField Controllers to get data from TextFields
  final phoneNo = TextEditingController();

  //Get phoneNo from user (Screen) and pass it to Auth Repository for Firebase Authentication
  void phoneAuthentication(String phoneNo) {
    AuthenticationRepository.instance.verifyPhoneNumber(phoneNo);
  }
}
