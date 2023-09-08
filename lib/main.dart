// Import the necessary packages and classes.
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_frontend/core/utils/initial_bindings.dart';
import 'package:flutter_frontend/routes/app_routes.dart';
import 'firebase_options.dart'; // Ensure this import exists.
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase with the specified options.
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Run the app.
  runApp(FinalProject());
}

class FinalProject extends StatelessWidget {
  FinalProject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Final Project',

      // Set the initial route to the splash screen.
      initialRoute: AppRoutes.splashScreen,

      // Define the app's routes.
      getPages: AppRoutes.pages,

      // Initialize bindings using InitialBindings.
      initialBinding: InitialBindings(),
    );
  }
}
