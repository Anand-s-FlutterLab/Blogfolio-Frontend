import 'package:flutter_frontend/core/app_export.dart';
import 'package:flutter_frontend/core/utils/validation_function.dart';
import 'package:flutter_frontend/presentation/signup_screen/controller/signup_controller.dart';

class SignupScreen extends GetWidget<SignupController> {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
          child: Container(
        width: width,
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
            key: controller.signupFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: height * 0.1,
                ),
                customText(
                  text: "Signup",
                  color: primaryColor,
                  fontSize: width * 0.1,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(
                  height: 10,
                ),
                customText(
                  text: "Create your account",
                  color: primaryColor,
                  fontSize: width * 0.06,
                  fontWeight: FontWeight.normal,
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Container(
                  decoration: AppDecoration.inputBoxDecorationShadow(),
                  child: TextFormField(
                    controller: controller.nameController,
                    style: AppStyle.textFormFieldStyle(
                        color: Colors.black.withOpacity(0.6),
                        fontSize: width * 0.05),
                    keyboardType: TextInputType.emailAddress,
                    decoration: AppDecoration().textInputDecoration(
                        hintText: "Enter Your Full Name",
                        lableText: "Name",
                        icon: Icons.person),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please provide a Name';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: height * 0.025,
                ),
                Container(
                  decoration: AppDecoration.inputBoxDecorationShadow(),
                  child: TextFormField(
                    controller: controller.mobileController,
                    style: AppStyle.textFormFieldStyle(
                        color: Colors.black.withOpacity(0.6),
                        fontSize: width * 0.05),
                    keyboardType: TextInputType.number,
                    decoration: AppDecoration().textInputDecoration(
                      hintText: "Enter Mobile Number",
                      lableText: "Mobile Number",
                      icon: Icons.phone,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please provide a Mobile Number';
                      }
                      if (value.length != 10) {
                        return 'Please enter valid Mobile Number';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: height * 0.025,
                ),
                Container(
                  decoration: AppDecoration.inputBoxDecorationShadow(),
                  child: TextFormField(
                    controller: controller.emailController,
                    style: AppStyle.textFormFieldStyle(
                        color: Colors.black.withOpacity(0.6),
                        fontSize: width * 0.05),
                    keyboardType: TextInputType.emailAddress,
                    decoration: AppDecoration().textInputDecoration(
                        hintText: "Enter Email Address Here",
                        lableText: "Email",
                        icon: Icons.email_rounded),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please provide a Email Address';
                      }
                      if (!emailValidator.hasMatch(value)) {
                        return 'Enter Valid Email';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: height * 0.025,
                ),
                Container(
                  decoration: AppDecoration.inputBoxDecorationShadow(),
                  child: Obx(
                    () => TextFormField(
                        style: AppStyle.textFormFieldStyle(
                            color: Colors.black.withOpacity(0.6),
                            fontSize: width * 0.05),
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
                            return "Please provide Password";
                          }
                          if (!passwordValidator.hasMatch(value)) {
                            return 'Enter Valid Password';
                          }
                          return null;
                        }),
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                GestureDetector(
                  onTap: () => controller.onSignup(),
                  child: Container(
                    width: width,
                    padding: const EdgeInsets.only(bottom: 15, top: 15),
                    decoration: AppDecoration.buttonBoxDecoration(),
                    child: Obx(
                      () => controller.isSignup.value
                          ? customLoadingAnimation(size: width * 0.1)
                          : customText(
                              text: "Signup",
                              color: Colors.white,
                              fontSize: width * 0.06,
                            ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                customText(
                  color: blackColor,
                  text: "Already have an account?",
                  fontSize: width * 0.05,
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                GestureDetector(
                  onTap: () => Get.offNamed(AppRoutes.loginScreen),
                  child: customText(
                    color: primaryColor,
                    text: "Login Here",
                    fontSize: width * 0.05,
                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
