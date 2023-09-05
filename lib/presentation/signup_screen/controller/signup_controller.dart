import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_frontend/core/app_export.dart';
import 'package:flutter_frontend/presentation/signup_screen/model/signup_model.dart';

class SignupController extends GetxController {
  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool obscureText = true.obs;
  RxBool isSignup = false.obs;

  Future<void> onSignup() async {
    isSignup.value = true;
    if (signupFormKey.currentState!.validate()) {
      {
        FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailController.text, password: passwordController.text)
            .then((userCredential) {
          print(userCredential.user!.uid);
          userID.value = userCredential.user!.uid;
          userID.refresh();
          addNewUser();
          Get.offAllNamed(AppRoutes.homeScreen);
          return userCredential;
        }).catchError(
          (error) {
            handleFirebaseError(error);
            return Future.error(error);
          },
        );
      }
    } else {
      isSignup.value = false;
    }
  }

  Future<void> addNewUser() async {
    try {
      SignUpModel signUpData = SignUpModel(
        name: nameController.text,
        mobile: mobileController.text.toString(),
        emailAddress: emailController.text,
      );
      final DocumentReference productDoc = FirebaseFirestore.instance
          .collection(collectionUsers)
          .doc(userID.value);
      await productDoc.set(signUpData.toJson()).then((value) {
        isSignup.value = false;
      }).catchError((error) {
        handleFirebaseError(error);
      });
    } catch (error) {
      handleFirebaseError(error);
    }
  }
}
