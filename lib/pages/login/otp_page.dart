import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:healthcare_system/controllers/otp_controller.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  int secondsRemaining = 30;
  bool enableResend = false;
  Timer? timer;
  var otpController = Get.put(OTPController());
  var smsCode = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width,
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: IntrinsicHeight(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                const Text(
                  "Verification",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Enter your OTP number!",
                  style: TextStyle(
                    color: Color.fromARGB(177, 23, 21, 21),
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                otp(),
                const SizedBox(
                  height: 15,
                ),
                button(),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  "Didn't receive the code?",
                  style: TextStyle(
                    color: Color.fromARGB(177, 23, 21, 21),
                    fontSize: 18,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () => enableResend ? _resendCode() : null,
                      child: Text(
                        "Resend",
                        style: TextStyle(
                          color: enableResend
                              ? const Color.fromARGB(255, 254, 95, 94)
                              : const Color.fromARGB(177, 23, 21, 21),
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Text(
                      " in $secondsRemaining s",
                      style: const TextStyle(
                        color: Color.fromARGB(177, 23, 21, 21),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Image(
                  image: const AssetImage("assets/images/auth2.png"),
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width * 0.8,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget otp() {
    return OTPTextField(
      length: 6,
      width: MediaQuery.of(context).size.width * 0.9,
      fieldWidth: 50,
      style: const TextStyle(
        fontSize: 24,
        color: Colors.black,
      ),
      otpFieldStyle: OtpFieldStyle(
        backgroundColor: Colors.white,
        focusBorderColor: Colors.black,
        enabledBorderColor: Colors.black,
        disabledBorderColor: Colors.black,
      ),
      fieldStyle: FieldStyle.box,
      textFieldAlignment: MainAxisAlignment.spaceAround,
      onCompleted: (code) {
        setState(
          () {
            smsCode = code;
            OTPController.instance.verifyOTP(smsCode);
          },
        );
      },
    );
  }

  // Widget otpNumber() {
  //   return Padding(
  //     padding: const EdgeInsets.all(12.0),
  //     child: SizedBox(
  //       width: 64,
  //       child: TextField(
  //         inputFormatters: <TextInputFormatter>[
  //           FilteringTextInputFormatter.digitsOnly,
  //           LengthLimitingTextInputFormatter(1),
  //         ],
  //         textAlign: TextAlign.center,
  //         keyboardType: TextInputType.number,
  //         decoration: const InputDecoration(
  //           focusedBorder: OutlineInputBorder(
  //             borderRadius: BorderRadius.all(Radius.circular(10)),
  //             borderSide: BorderSide(
  //               color: Colors.black,
  //               width: 2,
  //             ),
  //           ),
  //           enabledBorder: OutlineInputBorder(
  //             borderRadius: BorderRadius.all(Radius.circular(10)),
  //             borderSide: BorderSide(
  //               color: Colors.black,
  //               width: 2,
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget button() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.25,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          OTPController.instance.verifyOTP(smsCode);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 45, 65, 252),
          shape: const StadiumBorder(),
          padding: const EdgeInsets.all(4),
        ),
        child: const Text(
          "Verify",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  initState() {
    super.initState();
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        if (secondsRemaining != 0) {
          setState(
            () {
              secondsRemaining--;
            },
          );
        } else {
          setState(
            () {
              enableResend = true;
            },
          );
        }
      },
    );
  }

  void _resendCode() {
    setState(
      () {
        secondsRemaining = 30;
        enableResend = false;
      },
    );
  }

  @override
  dispose() {
    timer?.cancel();
    super.dispose();
  }
}
