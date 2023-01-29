import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:healthcare_system/services/authclass.dart';
import 'package:healthcare_system/pages/login/phone_page.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));
  runApp(const MyApp());
}

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   await FirebaseAppCheck.instance.activate(
//     webRecaptchaSiteKey: 'recaptcha-v3-site-key',
//     // Set androidProvider to `AndroidProvider.debug`
//     androidProvider: AndroidProvider.debug,
//   );
//   runApp(const MyApp());
// }

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // void signup() async {
  //   try {
  //     await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //       email: "abc@gmail.com",
  //       password: "abc123",
  //     );
  //   } catch (e) {
  //     // ignore: avoid_print
  //     print(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      defaultTransition: Transition.fade,
      // home: const PhonePage(),
      home: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      )
      // home: Scaffold(
      //   appBar: AppBar(
      //     title: const Text("Firebase Auth"),
      //   ),
      //   body: Center(
      //     child: ElevatedButton(
      //       onPressed: signup,
      //       child: const Text("Sign Up"),
      //     ),
      //   ),
      // ),
    );
  }
}
