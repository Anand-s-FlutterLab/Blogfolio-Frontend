// Import necessary packages and files
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_frontend/core/app_export.dart';
import 'package:flutter_frontend/presentation/signup_screen/model/signup_model.dart';

// Create a SignupController class that extends GetxController
class SignupController extends GetxController {
  // Create a GlobalKey for the signup form
  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  // Initialize text editing controllers for various form fields
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Create observables for password visibility and signup state
  RxBool obscureText = true.obs;
  RxBool isSignup = false.obs;

  // Dispose method to release resources when the controller is disposed
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    passwordController.dispose();
  }

  // Method to handle user registration
  Future<void> onSignup() async {
    isSignup.value = true;
    // Validate the form
    if (signupFormKey.currentState!.validate()) {
      // Create a new user with email and password using Firebase Authentication
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text)
          .then((userCredential) {
        // Handle successful user creation
        print(userCredential.user!.uid);
        // Set the current user's ID
        userID.value = userCredential.user!.uid;
        userID.refresh();
        // Add the new user to the database
        addNewUser();
        // Navigate to the portfolio screen
        Get.offAllNamed(AppRoutes.portfolioScreen);
        return userCredential;
      }).catchError(
            (error) {
          // Handle Firebase authentication error
          handleFirebaseError(error);
          return Future.error(error);
        },
      );
    } else {
      isSignup.value = false;
    }
  }

  // Method to add a new user to the database
  Future<void> addNewUser() async {
    try {
      // Create a SignUpModel object with user data
      SignUpModel signUpData = SignUpModel(
        name: nameController.text,
        mobile: mobileController.text.toString(),
        emailAddress: emailController.text,
      );
      // Store user data in local storage
      writeStorage(storageUserName, nameController.text);
      writeStorage(storageEmail, emailController.text);
      writeStorage(storageMobile, mobileController.text);
      writeStorage(storageUserProfileURL, defaultProfileImage);
      // Reference to the Firestore document for the user
      final DocumentReference productDoc = FirebaseFirestore.instance
          .collection(collectionUsers)
          .doc(userID.value);
      // Set user data in the Firestore database
      await productDoc.set(signUpData.toJson()).then((value) {
        isSignup.value = false;
      }).catchError((error) {
        // Handle Firestore error
        handleFirebaseError(error);
      });
    } catch (error) {
      // Handle other errors
      handleFirebaseError(error);
    }
  }
}
