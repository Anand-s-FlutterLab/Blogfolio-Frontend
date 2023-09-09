import 'package:flutter_frontend/core/app_export.dart';

// Import the permission handler utility.
import '../core/Utils/permission_handler.dart';

// Define a StatelessWidget for the permission error screen.
class PermissionErrorScreen extends StatelessWidget {
  const PermissionErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.blue.shade400,
                Colors.blue.shade800,
              ])),
          child: Column(
            children: [
              Container(
                color: Colors.transparent,
                child: Container(
                  height: Get.height - 175,
                  width: Get.width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(60.0)),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Permission Denied",
                            style: GoogleFonts.getFont('Signika Negative',
                                fontSize: Get.width * 0.15, color: Colors.blue),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Text(
                          "Sorry, but the user has denied the permission. The requested application cannot be accessed.",
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.getFont('Signika Negative',
                              fontSize: Get.width * 0.07,
                              color: Colors.black87),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        customImageView(
                          url: permissionDeniedImage,
                          fit: BoxFit.scaleDown, imgHeight: height * 0.346, imgWidth: width,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 140,
                width: Get.width,
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide.none,
                      ),
                      onPressed: () {
                        // Request the required permissions when the button is pressed.
                        PermissionManager.requestRequiredPermissions();
                      },
                      height: 80,
                      minWidth: Get.width - 50,
                      color: Colors.white,
                      child: const Text(
                        "Grant Permission",
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
