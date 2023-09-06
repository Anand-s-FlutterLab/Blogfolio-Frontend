import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_frontend/core/app_export.dart';

class InitialDataLoad extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    await initializeApp();
  }

  Future<void> initializeApp() async {
    userID.value = FirebaseAuth.instance.currentUser!.uid;
    userName.value = await readStorage(storageUserName) ?? "";
    email.value = await readStorage(storageEmail) ?? "";
  }
}
