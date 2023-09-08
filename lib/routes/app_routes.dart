import 'package:flutter_frontend/presentation/blog_screen/add_blog_screen.dart';
import 'package:flutter_frontend/presentation/blog_screen/binding/home_binding.dart';
import 'package:flutter_frontend/presentation/blog_screen/blog_details_screen.dart';
import 'package:flutter_frontend/presentation/blog_screen/blog_screen.dart';
import 'package:flutter_frontend/presentation/contact_form_screen/binding/contact_form_binding.dart';
import 'package:flutter_frontend/presentation/contact_form_screen/contact_form_screen.dart';
import 'package:flutter_frontend/presentation/error_screen.dart';
import 'package:flutter_frontend/presentation/login_screen/binding/login_binding.dart';
import 'package:flutter_frontend/presentation/login_screen/login_screen.dart';
import 'package:flutter_frontend/presentation/permission_error.dart';
import 'package:flutter_frontend/presentation/portfolio_screen/binding/portfolio_binding.dart';
import 'package:flutter_frontend/presentation/portfolio_screen/edit_profile_screen.dart';
import 'package:flutter_frontend/presentation/portfolio_screen/portfolio_screen.dart';
import 'package:flutter_frontend/presentation/portfolio_screen/profile_screen.dart';
import 'package:flutter_frontend/presentation/signup_screen/binding/signup_binding.dart';
import 'package:flutter_frontend/presentation/signup_screen/signup_screen.dart';
import 'package:flutter_frontend/presentation/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static String splashScreen = "/splash_screen";
  static String loginScreen = "/login_screen";
  static String signupScreen = "/signup_screen";
  static String blogScreen = "/blog_screen";
  static String blogDetailsScreen = "/blog_details_screen";
  static String addBlogScreen = "/add_blog_screen";
  static String contactFormScreen = "/contact_form_screen";
  static String portfolioScreen = "/portfolio_screen";
  static String profileScreen = "/profile_screen";
  static String editProfileScreen = "/edit_profile_screen";
  static String errorScreen = "/error_screen";
  static String permissionErrorScreen = "/permission_error_screen";

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
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: signupScreen,
      page: () => const SignupScreen(),
      binding: SignupBindings(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: blogScreen,
      page: () => const BlogScreen(),
      binding: BlogBindings(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: blogDetailsScreen,
      page: () => const BlogDetailsScreen(),
      binding: BlogBindings(),
    ),
    GetPage(
      name: addBlogScreen,
      page: () => const AddBlogScreen(),
      binding: BlogBindings(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: contactFormScreen,
      page: () => const ContactFormScreen(),
      binding: ContactFormBindings(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: portfolioScreen,
      page: () => const PortfolioScreen(),
      binding: PortfolioBindings(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: profileScreen,
      page: () => const ProfileScreen(),
      binding: PortfolioBindings(),
    ),
    GetPage(
      name: editProfileScreen,
      page: () => const EditProfileScreen(),
      binding: PortfolioBindings(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: errorScreen,
      page: () => const ErrorScreen(),
      bindings: const [],
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: permissionErrorScreen,
      page: () => const PermissionErrorScreen(),
      bindings: const [],
      transition: Transition.rightToLeft,
    ),
  ];
}
