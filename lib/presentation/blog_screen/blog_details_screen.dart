import 'package:flutter_frontend/core/app_export.dart';
import 'package:flutter_frontend/presentation/blog_screen/controller/blog_controller.dart';

class BlogDetailsScreen extends GetWidget<BlogController> {
  const BlogDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int index = controller.currentSelectedBlog.value;
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            shape: const OutlineInputBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(60),
              ),
              borderSide: BorderSide.none,
            ),
            backgroundColor: Colors.grey.shade100,
            elevation: 0,
            centerTitle: true,
            leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(Icons.arrow_back_ios, color: whiteColor),
            ),
            expandedHeight: Get.height * 0.50,
            flexibleSpace: FlexibleSpaceBar(
              background: SizedBox(
                height: height * 0.5,
                child: Hero(
                   tag: "BlogImage_${controller.blogModel.data[index].id}",
                  child: customImageView(
                    url: controller.blogModel.data[index].attributes.imageUrl,
                    imgHeight: height * 0.5,
                    imgWidth: width,
                    borderRadius: 0,
                    radiusBottomLeft: 70,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customText(
                    text: controller.blogModel.data[index].attributes.title,
                    textAlign: TextAlign.start,
                    color: primaryColor,
                    fontSize: width * 0.07,
                    maxLines: 3,
                  ),
                  Row(
                    children: [
                      customText(
                        text:
                            "${controller.blogModel.data[index].attributes.updatedAt.toString().substring(0, 10)}・${controller.blogModel.data[index].attributes.readMin} min read",
                        textAlign: TextAlign.start,
                        color: blackColor,
                        fontSize: width * 0.04,
                        maxLines: 3,
                      ),
                    ],
                  ),
                  customText(
                    text:
                        "Written by: ${controller.blogModel.data[index].attributes.author}",
                    textAlign: TextAlign.start,
                    color: greyColor,
                    fontSize: width * 0.04,
                    maxLines: 3,
                  ),
                  SizedBox(
                    height: height * 0.034,
                  ),
                  Text(
                    controller.blogModel.data[index].attributes.content,
                    style: GoogleFonts.signikaNegative(
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.justify,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
