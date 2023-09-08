import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_frontend/core/utils/initial_bindings.dart';
import 'package:flutter_frontend/routes/app_routes.dart';

// import 'package:flutter_frontend/core/Utils/initial_binding.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    FinalProject(),
  );
}

class FinalProject extends StatelessWidget {
  FinalProject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Final Project',
      initialRoute: AppRoutes.splashScreen,
      getPages: AppRoutes.pages,
      initialBinding: InitialBindings(),
    );
  }
}
