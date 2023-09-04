import 'package:flutter_frontend/presentation/home_screen/binding/home_binding.dart';
import 'package:flutter_frontend/presentation/home_screen/blog_screen.dart';
import 'package:flutter_frontend/presentation/home_screen/home_screen.dart';
import 'package:flutter_frontend/presentation/login_screen/binding/login_binding.dart';
import 'package:flutter_frontend/presentation/login_screen/login_screen.dart';
import 'package:flutter_frontend/presentation/signup_screen/binding/signup_binding.dart';
import 'package:flutter_frontend/presentation/signup_screen/signup_screen.dart';
import 'package:flutter_frontend/presentation/splash_screen.dart';
import 'package:flutter_frontend/presentation/user_profile_screen/binding/user_profile_binding.dart';
import 'package:flutter_frontend/presentation/user_profile_screen/user_profile_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static String splashScreen = "/splash_screen";
  static String loginScreen = "/login_screen";
  static String signupScreen = "/signup_screen";
  static String homeScreen = "/home_screen";
  static String blogScreen = "/blog_screen";
  static String userProfileScreen = "/user_profile_screen";

  static List<GetPage> pages = [
    GetPage(
      name: splashScreen,
      page: () => const SplashScreen(),
      bindings: const [],
    ),
    GetPage(
      name: loginScreen,
      page: () => const LoginScreen(),
      binding: LoginBindings(),
    ),
    GetPage(
      name: signupScreen,
      page: () => const SignupScreen(),
      binding: SignupBindings(),
    ),
    GetPage(
      name: homeScreen,
      page: () => const HomeScreen(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: blogScreen,
      page: () => const BlogScreen(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: userProfileScreen,
      page: () => UserProfileScreen(),
      binding: UserProfileBindings(),
    ),
  ];
}
