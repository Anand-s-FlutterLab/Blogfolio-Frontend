import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_frontend/core/app_export.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool obscureText = true.obs;
  RxBool isLogin = false.obs;

  Future<void> onLogin() async {
    if (loginFormKey.currentState!.validate()) {
      try {
        isLogin.value = true;
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(
              email: emailController.text,
              password: passwordController.text,
            )
            .then(
              (value) => Get.offAllNamed(AppRoutes.blogScreen),
            );
      } catch (error) {
        handleFirebaseError(error);
        return Future.error(error);
      } finally {
        isLogin.value = false;
      }
    }
  }
}
