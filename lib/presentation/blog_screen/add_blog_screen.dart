import 'package:flutter_frontend/core/app_export.dart';
import 'package:flutter_frontend/presentation/blog_screen/controller/blog_controller.dart';

class AddBlogScreen extends GetWidget<BlogController> {
  const AddBlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: customAppbar(title: "Blog"),
      body: Container(
        padding: const EdgeInsets.all(20),
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  _buildImagePicker(),
                  Positioned(
                    top: -10,
                    right: -10,
                    child: GestureDetector(
                      onTap: () => controller.openImagePicker(),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.15),
                            shape: BoxShape.circle),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Icon(Icons.edit_rounded,
                              color: Colors.blue.shade800),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.03,
              ),
              _buildTextInputField(
                labelText: "Title",
                controller: controller.titleController,
                icon: Icons.title,
                hintText: "Enter Title Here",
                errorMessage: "Please Enter Valid Title",
              ),
              SizedBox(
                height: height * 0.03,
              ),
              _buildTextInputField(
                labelText: "Content",
                controller: controller.contentController,
                icon: Icons.article_outlined,
                hintText: "Enter Content Here",
                errorMessage: "Please Enter Valid Content",
                maxLine: true,
              ),
              SizedBox(
                height: height * 0.03,
              ),
              _buildTextInputField(
                labelText: "Reading Time (Min)",
                controller: controller.readTimeController,
                icon: Icons.chrome_reader_mode_outlined,
                hintText: "Enter Title Read Minutes Here",
                errorMessage: "Please Enter Valid Read Min",
              ),
              SizedBox(
                height: height * 0.04,
              ),
              GestureDetector(
                onTap: () {
                  final data = Get.arguments;
                  if (data[1] == "True") {
                    controller.editBlog(data[0]);
                  } else {
                    controller.addBlogs();
                  }
                },
                child: Container(
                  width: width,
                  padding: const EdgeInsets.only(bottom: 15, top: 15),
                  decoration: AppDecoration.buttonBoxDecoration(),
                  child: Obx(
                    () => controller.isAddBlogPressed.value
                        ? customLoadingAnimation(size: width * 0.1)
                        : customText(
                            text: "Submit",
                            color: Colors.white,
                            fontSize: width * 0.06,
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImagePicker() {
    return SizedBox(
      width: width * 0.5,
      height: height * 0.25,
      child: Obx(
        () => GestureDetector(
          onTap: () {
            controller.openImagePicker();
          },
          child: Container(
            decoration: AppDecoration.inputBoxDecorationShadowWithBorder(),
            child: Container(
              padding: const EdgeInsets.all(5),
              alignment: Alignment.center,
              width: height * 0.2,
              height: height * 0.25,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: controller.profileImage.value != null
                  ? Image.file(controller.profileImage.value!,
                      fit: BoxFit.cover)
                  : customImageView(
                      // url: controller.editProfileModel.profileUrl.isEmpty
                      //     ? defaultProfileImage
                      //     : controller.editProfileModel.profileUrl,
                      url: controller.profileURL.value.isEmpty
                          ? defaultProfileImage
                          : controller.profileURL.value,
                      imgHeight: height * 0.25,
                      imgWidth: width * 0.5,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildTextInputField({
  required String labelText,
  required String hintText,
  required TextEditingController controller,
  required String errorMessage,
  required IconData icon,
  bool maxLine = false,
  TextInputType textInputType = TextInputType.text,
}) {
  return Container(
    width: width,
    decoration: AppDecoration.inputBoxDecorationShadow(),
    child: TextFormField(
      style: AppStyle.textFormFieldStyle(fontSize: width * 0.05),
      keyboardType: textInputType,
      maxLines: maxLine ? null : 1,
      decoration: AppDecoration().textInputDecoration(
          lableText: labelText, icon: icon, hintText: labelText),
      controller: controller,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return errorMessage;
        }
        return null;
      },
    ),
  );
}
