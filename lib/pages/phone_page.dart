import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PhonePage extends StatefulWidget {
  const PhonePage({Key? key}) : super(key: key);

  @override
  State<PhonePage> createState() => _PhonePageState();
}

class _PhonePageState extends State<PhonePage> {
  // bool isKeyboardVisible = false;
  // late final ScrollController scrollController;
  bool phoneValid = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController phoneController = TextEditingController();
  String verificationId = "";
  String smsCode = "";

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
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Image(
                  image: const AssetImage("assets/images/auth1.png"),
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width * 0.8,
                ),
                const Text(
                  "Registration",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Enter your phone number!",
                  style: TextStyle(
                    color: Color.fromARGB(177, 23, 21, 21),
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                phoneNumber(),
                const SizedBox(
                  height: 20,
                ),
                button(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget phoneNumber() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 64,
      child: TextFormField(
        keyboardType: TextInputType.phone,
        onChanged: (value) {
          value.length == 10
              ? setState(
                  () {
                    phoneValid = true;
                  },
                )
              : setState(
                  () {
                    phoneValid = false;
                  },
                );
        },
        controller: phoneController,
        style: const TextStyle(
          fontSize: 24,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(10),
        ],
        decoration: InputDecoration(
          hintText: "Phone Number",
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 21,
            fontWeight: FontWeight.normal,
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: Colors.black,
              width: 2,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: Colors.black,
              width: 2,
            ),
          ),
          prefixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Padding(
                padding: EdgeInsets.only(
                  top: 5.0,
                  bottom: 5.0,
                  left: 10.0,
                  right: 2.0,
                ),
                child: Image(
                  image: AssetImage("assets/images/india.png"),
                  height: 32,
                  width: 32,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 5.0,
                  bottom: 5.0,
                  right: 10.0,
                  left: 2.0,
                ),
                child: Text(
                  "+91",
                  style: TextStyle(
                    color: Color.fromARGB(255, 254, 95, 94),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget button() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.3,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          phoneValid
              ? verifyPhone()
              : ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Enter a valid phone number",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    backgroundColor: Colors.black,
                  ),
                );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 45, 65, 252),
          shape: const StadiumBorder(),
          padding: const EdgeInsets.all(4),
        ),
        child: const Text(
          "Send OTP",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void verifyPhone() async {
    auth.verifyPhoneNumber(
      phoneNumber: '+91 ${phoneController.text.toString().trim()}',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then(
          (value) {
            showMessageBar("Phone number verified successfully");
          },
        );
      },
      verificationFailed: (FirebaseAuthException e) {
        showMessageBar(e.message!);
      },
      codeSent: (String verificationId, int? resendToken) {
        verificationId = verificationId;
        setState(() {});
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void showMessageBar(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
      ),
    );
  }

  // void setData(String verificationId) {
  //   setState(
  //     () {
  //       verificationIdFinal = verificationId;
  //     },
  //   );
  // }

  // void verifyPhone() async {
  //   try {
  //     await auth.verifyPhoneNumber(
  //       phoneNumber: "+91 ${phoneController.text}",
  //       verificationCompleted: (PhoneAuthCredential credential) async {
  //         await auth.signInWithCredential(credential);
  //       },
  //       verificationFailed: (FirebaseAuthException e) {
  //         if (e.code == 'invalid-phone-number') {
  //           ScaffoldMessenger.of(context).showSnackBar(
  //             const SnackBar(
  //               content: Text(
  //                 "Enter a valid phone number",
  //                 style: TextStyle(
  //                   color: Colors.white,
  //                 ),
  //               ),
  //               backgroundColor: Colors.black,
  //             ),
  //           );
  //         }
  //       },
  //       codeSent: (String verificationId, int? resendToken) {
  //         setState(
  //           () {
  //             verificationIdFinal = verificationId;
  //           },
  //         );
  //       },
  //       codeAutoRetrievalTimeout: (String verificationId) {
  //         setState(
  //           () {
  //             verificationIdFinal = verificationId;
  //           },
  //         );
  //       },
  //     );
  //   } catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text(
  //           e.toString(),
  //           style: const TextStyle(
  //             color: Colors.white,
  //           ),
  //         ),
  //         backgroundColor: Colors.black,
  //       ),
  //     );
  //   }
  // }

  // Future<void> _scrollToBottomOnKeyboardOpen() async {
  //   while (!isKeyboardVisible) {
  //     await Future.delayed(const Duration(milliseconds: 50));
  //   }

  //   await Future.delayed(const Duration(milliseconds: 250));

  //   await scrollController.animateTo(
  //     scrollController.position.maxScrollExtent,
  //     duration: const Duration(milliseconds: 250),
  //     curve: Curves.easeIn,
  //   );
  // }
}
