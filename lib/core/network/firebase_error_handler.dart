// Import the necessary packages.
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_frontend/widgets/snackbar.dart';

// Function to handle Firebase authentication errors and display a snackbar with an error message.
void handleFirebaseError(dynamic error) {
  String errorMessage = '';

  if (error is FirebaseAuthException) {
    // Handle Firebase Authentication errors.
    switch (error.code) {
      case 'invalid-email':
        errorMessage = 'Invalid email address.';
        break;
      case 'user-disabled':
        errorMessage = 'User account has been disabled.';
        break;
      case 'user-not-found':
        errorMessage = 'User not found.';
        break;
      case 'wrong-password':
        errorMessage = 'Wrong password.';
        break;
      case 'email-already-in-use':
        errorMessage = 'Email is already in use';
        break;
      case 'weak-password':
        errorMessage = 'Password is too weak';
        break;
      case 'requires-recent-login':
        errorMessage = 'Session Expired. Login Again';
        break;
      default:
        errorMessage = 'An error occurred.';
        break;
    }
  } else if (error is FirebaseException) {
    // Handle generic Firebase exceptions.
    switch (error.code) {
      case 'too-many-requests':
        errorMessage = 'Too many requests, please try again later';
        break;
      default:
        errorMessage = error.message ?? errorMessage;
        break;
    }
  }

  // Display a custom snackbar with the error message.
  customSnackBar("Error", errorMessage);
}
