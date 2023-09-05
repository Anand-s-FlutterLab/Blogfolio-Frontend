import 'package:flutter_frontend/core/app_export.dart';
import 'package:flutter_frontend/presentation/blog_screen/controller/blog_controller.dart';

class BlogScreen extends GetWidget<BlogController> {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            height: height,
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.02,
                ),
                Row(
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
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () => Get.toNamed(AppRoutes.addBlogScreen),
                      child: Container(
                        decoration: AppDecoration.containerBoxDecoration(),
                        padding: const EdgeInsets.all(5),
                        child: Icon(
                          Icons.add_rounded,
                          size: width * 0.09,
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        controller.currentSelectedBlog.value = index;
                        Get.toNamed(AppRoutes.blogDetailsScreen);
                      },
                      child: Container(
                        decoration: AppDecoration.containerBoxDecoration(),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                              ),
                              child: Image(
                                image: const NetworkImage(
                                  "https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-1080x675.jpg",
                                ),
                                height: height * 0.1730,
                                width: width * 0.2919,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              height: height * 0.1730,
                              width: width * 0.7081 - 40,
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: height * 0.002,
                                  ),
                                  customText(
                                    fontSize: width * 0.06,
                                    text: controller.blogList[index].title,
                                    color: primaryColor,
                                    maxLines: 2,
                                    textAlign: TextAlign.start,
                                  ),
                                  SizedBox(
                                    height: height * 0.005,
                                  ),
                                  customText(
                                    text: controller.blogList[index].author,
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
                  separatorBuilder: (context, index) => SizedBox(
                    height: height * 0.023,
                  ),
                  itemCount: 2,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
