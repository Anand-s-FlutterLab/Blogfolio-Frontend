import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_frontend/core/app_export.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController scaleController;
  late Animation<double> scaleAnimation;

  double _opacity = 0;
  bool _value = true;

  @override
  void initState() {
    super.initState();

    scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            if (FirebaseAuth.instance.currentUser != null) {
              Get.offNamed(AppRoutes.portfolioScreen);
            } else {
              Get.offNamed(AppRoutes.loginScreen);
            }
            Timer(const Duration(milliseconds: 300), () {
              scaleController.reset();
            });
          }
        },
      );

    scaleAnimation =
        Tween<double>(begin: 0.0, end: 12).animate(scaleController);

    Timer(const Duration(milliseconds: 600), () {
      setState(() {
        _opacity = 1.0;
        _value = false;
      });
    });
    Timer(const Duration(milliseconds: 2000), () {
      setState(() {
        scaleController.forward();
      });
    });
  }

  @override
  void dispose() {
    scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: customText(
                  text: "Blogfolio",
                  fontSize: width * 0.1,
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Center(
            child: AnimatedOpacity(
              curve: Curves.fastLinearToSlowEaseIn,
              duration: const Duration(seconds: 6),
              opacity: _opacity,
              child: AnimatedContainer(
                curve: Curves.fastLinearToSlowEaseIn,
                duration: const Duration(seconds: 3),
                height: _value ? 50 : 300,
                width: _value ? 50 : 300,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.deepPurple.withOpacity(.2),
                      blurRadius: 100,
                      spreadRadius: 10,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  children: [
                    Image(
                      image: AssetImage(appLogo),
                      fit: BoxFit.cover,
                    ),
                    Center(
                      child: AnimatedBuilder(
                        animation: scaleAnimation,
                        builder: (c, child) => Transform.scale(
                          scale: scaleAnimation.value,
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
