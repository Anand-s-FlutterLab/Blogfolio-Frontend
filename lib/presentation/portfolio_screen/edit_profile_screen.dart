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
          padding: const EdgeInsets.all(20),
          height: height,
          width: width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      decoration: AppDecoration.containerBoxDecoration(
                          borderRadius: 12),
                      child: customImageView(
                          url: defaultProfileImage,
                          // url: controller.userProfileModel.profileURL.isEmpty
                          //     ? defaultProfileImage
                          //     : controller.userProfileModel.profileURL,
                          imgHeight: 100,
                          imgWidth: 100,
                          fit: BoxFit.scaleDown,
                          borderRadius: 12),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customText(
                          text: "Anand Patel",
                          fontSize: width * 0.08,
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        customText(text: "Email: anand@gmail.com"),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.05,
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
                  addTextField: controller.addProjectController,
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
                        controller.projectControllers.removeAt(index);
                      },
                      child: Column(
                        children: [
                          _buildTextInputField(
                            hintText: "Enter Project Title Here",
                            icon: Icons.add_task,
                            controller: controller.projectControllers[index],
                            errorMessage: "Please Provide Project Title",
                            labelText: "Project Title",
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                        ],
                      ),
                    ),
                    itemCount: controller.projectControllers.length,
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                titleBuilder(
                  title: "Skills",
                  addTextField: controller.addSkillController,
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
                        controller.skillControllers.removeAt(index);
                      },
                      child: Column(
                        children: [
                          _buildTextInputField(
                            hintText: "Enter Skill Here",
                            icon: Icons.add_chart,
                            controller: controller.skillControllers[index],
                            errorMessage: "Please Provide Skill",
                            labelText: "Skill",
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                        ],
                      ),
                    ),
                    itemCount: controller.skillControllers.length,
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                titleBuilder(
                  title: "Achievements",
                  addTextField: controller.addAchievementController,
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
                        controller.achievementControllers.removeAt(index);
                      },
                      child: Column(
                        children: [
                          _buildTextInputField(
                            hintText: "Enter Achievement Here",
                            icon: Icons.article,
                            controller:
                                controller.achievementControllers[index],
                            errorMessage: "Please Provide Achievement",
                            labelText: "Achievement",
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                        ],
                      ),
                    ),
                    itemCount: controller.achievementControllers.length,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget titleBuilder(
    {required String title, required VoidCallback addTextField}) {
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
                addTextField();
              },
              child: Icon(Icons.add),
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

Widget _buildTextInputField(
    {required String labelText,
    required String hintText,
    required TextEditingController controller,
    required String errorMessage,
    required IconData icon}) {
  return Container(
    width: width == 50 ? Get.width - 75 : width,
    decoration: AppDecoration.inputBoxDecorationShadow(),
    child: TextFormField(
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
