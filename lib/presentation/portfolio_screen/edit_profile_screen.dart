import 'package:flutter_frontend/presentation/portfolio_screen/controller/portfolio_controller.dart';
import 'package:flutter_frontend/core/app_export.dart';

class EditProfileScreen extends GetWidget<PortfolioController> {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: customAppbar(title: "Edit Profile"),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          height: height,
          width: width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration:
                      AppDecoration.containerBoxDecoration(borderRadius: 12),
                  child: customImageView(
                      url: defaultProfileImage,
                      // url: controller.userProfileModel.profileURL.isEmpty
                      //     ? defaultProfileImage
                      //     : controller.userProfileModel.profileURL,
                      imgHeight: height * 0.2,
                      imgWidth: height * 0.2,
                      fit: BoxFit.scaleDown,
                      borderRadius: 12),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                _buildTextInputField(
                  hintText: "Enter Name Here",
                  icon: Icons.person,
                  controller: controller.nameController..text = userName.value,
                  errorMessage: "Please Provide Name",
                  readOnly: true,
                  labelText: "Name",
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                _buildTextInputField(
                  hintText: "Enter Email Here",
                  icon: Icons.email_rounded,
                  controller: controller.emailController..text = email.value,
                  errorMessage: "Please Provide Email",
                  readOnly: true,
                  labelText: "Email",
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                _buildTextInputField(
                  hintText: "Enter Mobile Number Here",
                  icon: Icons.phone,
                  controller: controller.mobileController,
                  errorMessage: "Please Provide Mobile Number",
                  labelText: "Mobile Number",
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                titleBuilder(
                  title: "Projects",
                  addData: () {
                    controller.addData("project", "temp");
                  },
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Obx(
                  () => ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Dismissible(
                      key: UniqueKey(),
                      onDismissed: (direction) {
                        controller.portfolio['project]']?.removeAt(index);
                      },
                      child: Column(
                        children: [
                          Container(
                            width: width,
                            padding: const EdgeInsets.fromLTRB(20, 7, 20, 7),
                            decoration: BoxDecoration(
                              color: Colors.pink.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: customText(
                                color: Colors.pink.shade600,
                                fontSize: width * 0.05,
                                text: "Data"),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                        ],
                      ),
                    ),
                    itemCount: controller.portfolio['project']!.length,
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                titleBuilder(
                  title: "Skills",
                  addData: () {
                    controller.addData("skill", "temp");
                  },
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Obx(
                  () => ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (context, index) => Dismissible(
                      key: UniqueKey(),
                      onDismissed: (direction) {
                        controller.portfolio['skill']?.removeAt(index);
                      },
                      child: Column(
                        children: [
                          Container(
                            width: width,
                            padding: const EdgeInsets.fromLTRB(20, 7, 20, 7),
                            decoration: BoxDecoration(
                              color: Colors.orangeAccent.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: customText(
                                color: Colors.orangeAccent.shade700,
                                fontSize: width * 0.05,
                                text: "Data"),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                        ],
                      ),
                    ),
                    itemCount: controller.portfolio['skill']!.isNotEmpty
                        ? controller.portfolio['skill']!.length
                        : 0,
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                titleBuilder(
                  title: "Achievements",
                  addData: () {
                    controller.addData("achievement", "temp");
                  },
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Obx(
                  () => ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Dismissible(
                      key: UniqueKey(),
                      onDismissed: (direction) {
                        controller.portfolio['achievement']?.removeAt(index);
                      },
                      child: Column(
                        children: [
                          Container(
                            width: width,
                            padding: const EdgeInsets.fromLTRB(20, 7, 20, 7),
                            decoration: BoxDecoration(
                              color: Colors.cyan.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: customText(
                                color: Colors.cyan.shade600,
                                fontSize: width * 0.05,
                                text: "Data"),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                        ],
                      ),
                    ),
                    itemCount: controller.portfolio['achievement']!.isNotEmpty
                        ? controller.portfolio['achievement']!.length
                        : 0,
                  ),
                ),
                GestureDetector(
                  // onTap: () => controller.onLogin(),
                  child: Container(
                    width: width,
                    padding: const EdgeInsets.only(bottom: 15, top: 15),
                    decoration: AppDecoration.buttonBoxDecoration(),
                    child: Obx(
                      () => controller.isEditProfilePressed.value
                          ? customLoadingAnimation(size: width * 0.1)
                          : customText(
                              text: "Submit",
                              color: Colors.white,
                              fontSize: width * 0.06,
                            ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget titleBuilder(
    {required String title, required VoidCallback addData}) {
  return Column(
    children: [
      Container(
        height: 1,
        color: primaryColor,
      ),
      SizedBox(
        height: height * 0.008,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            customText(
              color: primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: width * 0.06,
              text: title,
            ),
            GestureDetector(
              onTap: () {
                addData();
              },
              child: const Icon(Icons.add),
            )
          ],
        ),
      ),
      SizedBox(
        height: height * 0.008,
      ),
      Container(
        height: 1,
        color: primaryColor,
      ),
    ],
  );
}

Widget _buildTextInputField({
  required String labelText,
  required String hintText,
  required TextEditingController controller,
  required String errorMessage,
  required IconData icon,
  bool readOnly = false,
}) {
  return Container(
    width: width == 50 ? Get.width - 75 : width,
    decoration: AppDecoration.inputBoxDecorationShadow(),
    child: TextFormField(
      readOnly: readOnly,
      style: AppStyle.textFormFieldStyle(fontSize: width * 0.05),
      keyboardType: TextInputType.text,
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
