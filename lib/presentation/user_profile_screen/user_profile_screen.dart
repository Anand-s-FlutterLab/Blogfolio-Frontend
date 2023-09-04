import 'package:flutter_frontend/presentation/user_profile_screen/controller/user_profile_controller.dart';
import 'package:flutter_frontend/core/app_export.dart';

class UserProfileScreen extends GetWidget<UserProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: profileBackgroundColor,
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: const Color.fromRGBO(203, 207, 250, 1),
            expandedHeight: Get.height * 0.4,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: profileBackgroundColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: AppDecoration.containerBoxDecoration(),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: customImageView(
                            url:
                                "https://static.vecteezy.com/system/resources/thumbnails/011/490/381/small/happy-smiling-young-man-avatar-3d-portrait-of-a-man-cartoon-character-people-illustration-isolated-on-white-background-vector.jpg",
                            imgHeight: 100,
                            imgWidth: 100,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    customText(
                        text: "Anand",
                        fontSize: width * 0.1,
                        color: primaryColor,
                        fontWeight: FontWeight.bold,

                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
