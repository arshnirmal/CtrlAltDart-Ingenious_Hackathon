import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:healthcare_system/pages/login/phone_page.dart';
import 'package:healthcare_system/pages/profile/profile_page.dart';

// import 'exceptions/login_with_email_and_pssword_failure.dart';
// import 'exceptions/signup_email_password_failure.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(
            () => const PhonePage(),
          )
        : Get.offAll(
            () => const ProfilePage(),
          );
  }

  Future<void> verifyPhoneNumber(String phoneNumber) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: '+91 $phoneNumber',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        Get.showSnackbar(
          GetSnackBar(
            title: e.code,
            message: e.message!,
            snackPosition: SnackPosition.BOTTOM,
          ),
        );
      },
      codeSent: (verificationId, resendToken) {
        this.verificationId.value = verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) {
        this.verificationId.value = verificationId;
      },
    );
  }

  Future<bool> verifyOTP(String otp) async {
    var credential = await _auth.signInWithCredential(
      PhoneAuthProvider.credential(
        verificationId: verificationId.value,
        smsCode: otp,
      ),
    );
    return credential.user != null ? true : false;
  }
  //FUNC
  // Future<String?> createUserWithEmailAndPassword(String email, String password) async {
  //   try {
  //     await _auth.createUserWithEmailAndPassword(email: email, password: password);
  //     firebaseUser.value != null ? Get.offAll(() => const Dashboard()) : Get.to(() => const WelcomeScreen());
  //   } on FirebaseAuthException catch (e) {
  //     final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
  //     return ex.message;
  //   } catch (_) {
  //     const ex = SignUpWithEmailAndPasswordFailure();
  //     return ex.message;
  //   }
  //   return null;
  // }

  // Future<String?> loginWithEmailAndPassword(String email, String password) async {
  //   try {
  //     await _auth.signInWithEmailAndPassword(email: email, password: password);
  //   } on FirebaseAuthException catch (e) {
  //     final ex = LogInWithEmailAndPasswordFailure.fromCode(e.code);
  //     return ex.message;
  //   } catch (_) {
  //     const ex = LogInWithEmailAndPasswordFailure();
  //     return ex.message;
  //   }
  //   return null;
  // }

  Future<void> logout() async => await _auth.signOut();
}
