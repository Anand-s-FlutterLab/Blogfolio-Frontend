// Import necessary libraries and packages
import 'package:flutter_frontend/core/app_export.dart'; // Import your application's core functionality and styles
import 'package:flutter_frontend/core/utils/validation_function.dart'; // Import validation functions
import 'package:flutter_frontend/presentation/login_screen/controller/login_controller.dart'; // Import the associated controller

// Define the `LoginScreen` class which extends `GetWidget` and takes an optional `key` parameter
class LoginScreen extends GetWidget<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold is the basic structure of the screen
    return Scaffold(
      backgroundColor: whiteColor, // Set the background color to white
      body: SafeArea(
        // SafeArea widget ensures content is not obscured by device notches or system bars
        child: Container(
          width: width, // Set the container's width to the screen width
          padding: const EdgeInsets.all(20), // Add padding to the container
          child: SingleChildScrollView(
            // SingleChildScrollView enables scrolling when the content overflows
            child: Form(
              key: controller.loginFormKey, // Assign the form key to the controller
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height * 0.17, // Create a sized box for spacing
                  ),
                  customText(
                    // Create a custom styled text widget for the title
                    text: "Welcome Back!",
                    color: primaryColor,
                    fontSize: width * 0.1,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  customText(
                    // Create a custom styled text widget for the subtitle
                    text: "Sign in to your account",
                    color: primaryColor,
                    fontSize: width * 0.06,
                    fontWeight: FontWeight.normal,
                  ),
                  SizedBox(
                    height: height * 0.05, // Add vertical spacing
                  ),
                  Container(
                    // Create a container for the email input field
                    decoration: AppDecoration.inputBoxDecorationShadow(), // Apply custom decoration
                    child: TextFormField(
                      controller: controller.emailController, // Connect the field to the controller
                      style: AppStyle.textFormFieldStyle(
                        color: Colors.black.withOpacity(0.6),
                        fontSize: width * 0.05,
                      ),
                      keyboardType: TextInputType.emailAddress,
                      decoration: AppDecoration().textInputDecoration(
                        hintText: "Enter Email Address Here",
                        lableText: "Email",
                        icon: Icons.email_rounded,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please provide an Email Address';
                        }
                        if (!emailValidator.hasMatch(value)) {
                          return 'Enter Valid Email';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    // Create a container for the password input field
                    decoration: AppDecoration.inputBoxDecorationShadow(), // Apply custom decoration
                    child: Obx(
                          () => TextFormField(
                        style: AppStyle.textFormFieldStyle(
                          color: Colors.black.withOpacity(0.6),
                          fontSize: width * 0.05,
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          labelText: "Password",
                          prefixIcon: Icon(Icons.lock, size: width * 0.06),
                          prefixIconColor: primaryColor,
                          suffix: GestureDetector(
                            onTap: () {
                              controller.obscureText.toggle();
                            },
                            child: controller.obscureText.value
                                ? const Icon(Icons.visibility_off_outlined)
                                : const Icon(Icons.visibility_outlined),
                          ),
                          labelStyle: AppStyle.textFormFieldStyle(
                              color: primaryColor, fontSize: width * 0.05),
                          hintText: "Enter Password Here",
                          hintStyle: AppStyle.textFormFieldStyle(
                              color: Colors.grey, fontSize: width * 0.05),
                          errorStyle: AppStyle.textFormFieldStyle(
                              color: Colors.red, fontSize: width * 0.05),
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding:
                          const EdgeInsets.fromLTRB(20, 20, 20, 20),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(color: Colors.grey)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                              BorderSide(color: Colors.grey.shade400)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                  color: Colors.red, width: 2.0)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                  color: Colors.red, width: 2.0)),
                        ),
                        controller: controller.passwordController,
                        obscureText: controller.obscureText.value,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Please provide a Password";
                          }
                          if (!passwordValidator.hasMatch(value)) {
                            return 'Enter a Valid Password';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.05, // Add vertical spacing
                  ),
                  GestureDetector(
                    onTap: () => controller.onLogin(), // Trigger the login function on tap
                    child: Container(
                      width: width,
                      padding:
                      const EdgeInsets.only(bottom: 15, top: 15), // Add padding
                      decoration: AppDecoration.buttonBoxDecoration(), // Apply custom button decoration
                      child: Obx(
                            () => controller.isLogin.value
                            ? customLoadingAnimation(size: width * 0.1) // Show loading animation when logging in
                            : customText(
                          text: "Login",
                          color: Colors.white,
                          fontSize: width * 0.06,
                        ), // Display "Login" text
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.04, // Add vertical spacing
                  ),
                  customText(
                    color: blackColor,
                    text: "Not having an Account?",
                    fontSize: width * 0.05,
                  ),
                  SizedBox(
                    height: height * 0.01, // Add vertical spacing
                  ),
                  GestureDetector(
                    onTap: () =>
                        Get.offNamed(AppRoutes.signupScreen), // Navigate to the signup screen on tap
                    child: customText(
                      color: primaryColor,
                      text: "Signup Here",
                      fontSize: width * 0.05,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
