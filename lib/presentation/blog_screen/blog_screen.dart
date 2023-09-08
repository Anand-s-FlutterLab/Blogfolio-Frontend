import 'package:flutter_frontend/core/app_export.dart';
import 'package:flutter_frontend/presentation/blog_screen/controller/blog_controller.dart';

class BlogScreen extends GetWidget<BlogController> {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getBlogs();
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: SingleChildScrollView(
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
                        SizedBox(
                          width: width - (width * 0.22),
                          child: FittedBox(
                            alignment: Alignment.centerLeft,
                            fit: BoxFit.scaleDown,
                            child: customText(
                              text: "Welcome ${userName.value}",
                              fontSize: width * 0.07,
                              fontWeight: FontWeight.bold,
                              color: blueGreyColor,
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                        customText(
                          text: "Time to Explore Blogfolio's blog.",
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
                Obx(
                  () => controller.initialLoad.value
                      ? Center(
                          child: SizedBox(
                            height: height * 0.7,
                            child: customLoadingAnimation(
                                size: height * 0.08, color: primaryColor),
                          ),
                        )
                      : controller.errorText.isNotEmpty
                          ? SizedBox(
                            height: height * 0.7,
                            child: Center(
                              child: customText(
                                color: Colors.red.shade700,
                                text: controller.errorText.value,
                                fontSize: width * 0.1,
                                maxLines: 2,
                                textAlign: TextAlign.start
                              ),
                            ),
                          )
                          : SizedBox(
                              height: height - (height * 0.225),
                              child: ListView.separated(
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                padding: const EdgeInsets.only(bottom: 10),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      controller.currentSelectedBlog.value =
                                          index;
                                      Get.toNamed(AppRoutes.blogDetailsScreen);
                                    },
                                    child: Container(
                                        decoration: AppDecoration
                                            .containerBoxDecoration(),
                                        child: Stack(
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(12),
                                                    bottomLeft:
                                                        Radius.circular(12),
                                                  ),
                                                  child: Hero(
                                                    tag: "BlogImage_${controller.blogModel.data[index].id}",
                                                    child: customImageView(
                                                      url: controller
                                                          .blogModel
                                                          .data[index]
                                                          .attributes
                                                          .imageUrl,
                                                      imgHeight: height * 0.1730,
                                                      imgWidth: width * 0.2919,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: height * 0.1730,
                                                  width: width * 0.7081 - 40,
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(
                                                        height: height * 0.002,
                                                      ),
                                                      customText(
                                                        fontSize: width * 0.06,
                                                        text: controller
                                                            .blogModel
                                                            .data[index]
                                                            .attributes
                                                            .title,
                                                        color: primaryColor,
                                                        maxLines: 2,
                                                        textAlign:
                                                            TextAlign.start,
                                                      ),
                                                      SizedBox(
                                                        height: height * 0.005,
                                                      ),
                                                      customText(
                                                        text: controller
                                                            .blogModel
                                                            .data[index]
                                                            .attributes
                                                            .author,
                                                        color: greyColor,
                                                      ),
                                                      const Spacer(),
                                                      Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: customText(
                                                            text:
                                                                "Last Updated: ${controller.blogModel.data[index].attributes.updatedAt.toString().substring(0, 10)}",
                                                            color: greyColor,
                                                            fontSize:
                                                                width * 0.035),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            if (userID.value ==
                                                controller.blogModel.data[index]
                                                    .attributes.authorId)
                                              Positioned(
                                                right: 0,
                                                top: 0,
                                                child: Column(
                                                  children: [
                                                    IconButton(
                                                      onPressed: () {
                                                        controller
                                                            .currentSelectedBlog
                                                            .value = index;
                                                        controller.onEdit();
                                                        Get.toNamed(
                                                            AppRoutes
                                                                .addBlogScreen,
                                                            arguments: [
                                                              controller
                                                                  .blogModel
                                                                  .data[controller
                                                                      .currentSelectedBlog
                                                                      .value]
                                                                  .id,
                                                            ]);
                                                      },
                                                      icon: const Icon(
                                                          Icons.edit),
                                                    ),
                                                    IconButton(
                                                      onPressed: () {
                                                        controller.deleteBlog(
                                                            controller
                                                                .blogModel
                                                                .data[index]
                                                                .id);
                                                      },
                                                      icon: const Icon(
                                                        Icons.delete,
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                          ],
                                        )),
                                  );
                                },
                                separatorBuilder: (context, index) => SizedBox(
                                  height: height * 0.02,
                                ),
                                itemCount: controller.blogModel.data.length,
                              ),
                            ),
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
