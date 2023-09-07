import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_frontend/core/app_export.dart';
import 'package:flutter_frontend/presentation/login_screen/model/login_model.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late LoginModel loginModel;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool obscureText = true.obs;
  RxBool isLogin = false.obs;

  @override
  void dispose(){
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  Future<void> onLogin() async {
    if (loginFormKey.currentState!.validate()) {
      try {
        isLogin.value = true;
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        )
            .then((userCredential) {
          getUserData(userCredential.user!.uid);
          Get.offNamed(AppRoutes.portfolioScreen);
        });
      } catch (error) {
        handleFirebaseError(error);
        return Future.error(error);
      } finally {
        isLogin.value = false;
      }
    }
  }

  Future<void> getUserData(String userId) async {
    try {
      final DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection(collectionUsers)
          .doc(userId)
          .get();

      if (snapshot.exists) {
        final data = snapshot.data() as Map<String, dynamic>;
        LoginModel loginModel = LoginModel.fromJson(data);
        userID.value = FirebaseAuth.instance.currentUser!.uid;
        userName.value = loginModel.name;
        await writeStorage(storageUserName, loginModel.name);
        await writeStorage(storageEmail, loginModel.emailAddress);
        await writeStorage(storageMobile, loginModel.mobile);
        await writeStorage(storageUserProfileURL, loginModel.profileURL);
        isLogin.value = false;
      } else {
        isLogin.value = false;
        customSnackBar(
            "Username Not Found",
            "Apologies, but the username you entered could not be located in our system.",
            "red");
        Get.toNamed(AppRoutes.loginScreen);
      }
    } catch (error) {
      print(error);
      isLogin.value = false;
      handleFirebaseError(error);
    }
  }
}
