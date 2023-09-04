import 'dart:math';

import 'package:flutter_frontend/core/app_export.dart';
import 'package:flutter_frontend/presentation/home_screen/controller/home_controller.dart';

class HomeScreen extends GetWidget<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.02,
            ),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customText(
                        text: "Welcome Anand",
                        fontSize: width * 0.07,
                        fontWeight: FontWeight.bold,
                        color: blueGreyColor,
                        textAlign: TextAlign.start,
                      ),
                      customText(
                          text: "Time to explore Blogfolio",
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.bold,
                          color: greyColor,
                          textAlign: TextAlign.start),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.userProfileScreen);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration:
                          AppDecoration.containerBoxDecoration(borderRadius: 40),
                      child: customImageView(
                        url:
                            "https://static.vecteezy.com/system/resources/thumbnails/011/490/381/small/happy-smiling-young-man-avatar-3d-portrait-of-a-man-cartoon-character-people-illustration-isolated-on-white-background-vector.jpg",
                        imgHeight: 50,
                        imgWidth: 50,
                        borderRadius: 40,
                      ),
                    ),
                  )
                ],
              ),
            ),
            ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.all(20),
                itemBuilder: (context, index) {
                  Random random = Random();
                  Color tagColor = Color.fromRGBO(
                    random.nextInt(200),
                    random.nextInt(150),
                    random.nextInt(200),
                    1,
                  );
                  return GestureDetector(
                    onTap: () {
                      controller.currentSelectedBlog.value = index;
                      Get.toNamed(AppRoutes.blogScreen);
                    },
                    child: Container(
                      decoration: AppDecoration.containerBoxDecoration(),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomLeft: Radius.circular(12),
                            ),
                            child: Image(
                              image: NetworkImage(
                                "https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-1080x675.jpg",
                              ),
                              height: 150,
                              width: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            height: 150,
                            width: width - 160,
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.fromLTRB(7, 4, 7, 4),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(45),
                                    color: tagColor.withOpacity(0.2),
                                  ),
                                  child: customText(
                                    color: tagColor,
                                    fontWeight: FontWeight.bold,
                                    text: controller.blogList[index].tags[0]
                                        .toUpperCase(),
                                    fontSize: width * 0.03,
                                  ),
                                ),
                                const SizedBox(height: 2,),
                                customText(
                                  fontSize: width * 0.06,
                                  text: controller.blogList[index].title,
                                  color: primaryColor,
                                  maxLines: 2,
                                  textAlign: TextAlign.start,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                customText(
                                  text:
                                      "Written By: ${controller.blogList[index].author}",
                                  color: greyColor,
                                ),
                                const Spacer(),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: customText(
                                      text:
                                          "Last Updated: ${controller.blogList[index].lastUpdatedDate}",
                                      color: greyColor,
                                      fontSize: width * 0.035),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                itemCount: 2),
          ],
        ),
      ),
      // bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
