// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:healthcare_system/pages/phone_page.dart';

class AuthClass {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final storage = const FlutterSecureStorage();

  // void storeTokenAndData(UserCredential userCredential) async {
  //   print("storing token and data");
  //   await storage.write(
  //     key: "token",
  //     value: userCredential.credential?.token.toString(),
  //   );
  //   await storage.write(
  //     key: "usercredential",
  //     value: userCredential.toString(),
  //   );
  // }

  // Future<String?> getToken() async {
  //   return await storage.read(
  //     key: "token",
  //   );
  // }

  Future<void> verifyPhoneNumber(
      String phoneNumber, BuildContext context, Function setData) async {
    verificationCompleted(PhoneAuthCredential phoneAuthCredential) async {
      showSnackBar(context, "Verification Completed");
    }

    verificationFailed(FirebaseAuthException exception) {
      showSnackBar(context, exception.toString());
    }

    codeSent(String verificationID, [int? forceResnedingtoken]) {
      showSnackBar(context, "Verification Code sent on the phone number");
      setData(verificationID);
    }

    codeAutoRetrievalTimeout(String verificationID) {
      showSnackBar(context, "Time out");
    }

    try {
      await _auth.verifyPhoneNumber(
        timeout: const Duration(seconds: 60),
        phoneNumber: phoneNumber,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  // Future<void> signInwithPhoneNumber(
  //   String verificationId,
  //   String smsCode,
  //   BuildContext context,
  // ) async {
  //   try {
  //     AuthCredential credential = PhoneAuthProvider.credential(
  //       verificationId: verificationId,
  //       smsCode: smsCode,
  //     );
  //     UserCredential userCredential = await _auth.signInWithCredential(
  //       credential,
  //     );
  //     storeTokenAndData(
  //       userCredential,
  //     );
  //     Navigator.pushAndRemoveUntil(
  //       context,
  //       MaterialPageRoute(
  //         builder: (builder) => const PhonePage(),
  //       ),
  //       (route) => false,
  //     );
  //     showSnackBar(context, "logged In");
  //   } catch (e) {
  //     showSnackBar(context, e.toString());
  //   }
  // }

  void showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
