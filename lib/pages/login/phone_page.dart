import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:healthcare_system/pages/login/otp_page.dart';
import 'package:healthcare_system/features/controllers/phone_controller.dart';

class PhonePage extends StatefulWidget {
  const PhonePage({Key? key}) : super(key: key);

  @override
  State<PhonePage> createState() => _PhonePageState();
}

class _PhonePageState extends State<PhonePage> {
  // bool isKeyboardVisible = false;
  // late final ScrollController scrollController;
  bool phoneValid = false;
  final _formKey = GlobalKey<FormState>();
  final controller = Get.put(SignUpController());
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
            child: Form(
              key: _formKey,
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
        controller: controller.phoneNo,
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
          if (phoneValid) {
            if (_formKey.currentState!.validate()) {
              SignUpController.instance.phoneAuthentication(
                controller.phoneNo.text.trim(),
              );
              Get.to(() => const OtpPage());
            }
          } else {
            showSnackBar("Enter a valid phone number");
          }
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

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
