import 'package:flutter_frontend/presentation/portfolio_screen/controller/portfolio_controller.dart';
import 'package:flutter_frontend/core/app_export.dart';

class EditProfileScreen extends GetWidget<PortfolioController> {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getUserProfile();
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: customAppbar(title: "Edit Profile"),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          height: height,
          width: width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Obx(
                      () => Container(
                        height: height * 0.25,
                        width: width * 0.5,
                        decoration: AppDecoration.containerBoxDecoration(
                          borderRadius: 12,
                        ),
                        child: controller.profileImage.value != null
                            ? Image.file(
                                controller.profileImage.value!,
                                fit: BoxFit.scaleDown,
                              )
                            : customImageView(
                                url: userProfileURL.value.isEmpty
                                    ? defaultProfileImage
                                    : userProfileURL.value,
                                imgHeight: height * 0.25,
                                imgWidth: width * 0.5,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    Positioned(
                      bottom: -10,
                      right: -10,
                      child: GestureDetector(
                        onTap: () => controller.openImagePicker(),
                        child: Container(
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: whiteColor,
                              width: 4,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Icon(
                              Icons.edit_rounded,
                              color: whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
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
                  controller: controller.mobileController..text = mobile.value,
                  errorMessage: "Please Provide Mobile Number",
                  labelText: "Mobile Number",
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                titleBuilder(
                  title: "Projects",
                  addData: () {
                    customBottomSheet(label: "project");
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
                        controller.portfolio['project']?.removeAt(index);
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
                              text: controller.portfolio['project']![index],
                            ),
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
                    customBottomSheet(label: "skill");
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
                              text: controller.portfolio['skill']![index],
                            ),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                        ],
                      ),
                    ),
                    itemCount: controller.portfolio['skill']!.length,
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                titleBuilder(
                  title: "Achievements",
                  addData: () {
                    customBottomSheet(label: "achievement");
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
                              text: controller.portfolio['achievement']![index],
                            ),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                        ],
                      ),
                    ),
                    itemCount: controller.portfolio['achievement']!.length,
                  ),
                ),
                GestureDetector(
                  onTap: () => controller.updateUserProfile(),
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

  Future customBottomSheet({required String label}) {
    return Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(20),
        height: 200,
        decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(40),
              topLeft: Radius.circular(40),
            ),
            boxShadow: const [
              BoxShadow(color: Colors.black26, blurRadius: 80, spreadRadius: 5)
            ]),
        child: Column(
          children: [
            _buildTextInputField(
                errorMessage: "Please enter $label",
                hintText: "Enter $label Here",
                icon: Icons.data_saver_on_outlined,
                controller: controller.addDataController,
                labelText: label,
                textInputType: TextInputType.text),
            SizedBox(
              height: height * 0.03,
            ),
            GestureDetector(
              onTap: () {
                controller.addData(label, controller.addDataController.text);
                Get.back();
              },
              child: Container(
                width: width,
                padding: const EdgeInsets.only(bottom: 15, top: 15),
                decoration: AppDecoration.buttonBoxDecoration(),
                child: customText(
                  text: "Submit",
                  color: Colors.white,
                  fontSize: width * 0.06,
                ),
              ),
            ),
          ],
        ),
      ),
      barrierColor: Colors.transparent,
      enableDrag: true,
    );
  }
}

Widget titleBuilder({required String title, required VoidCallback addData}) {
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

Widget _buildTextInputField(
    {required String labelText,
    required String hintText,
    required TextEditingController controller,
    required String errorMessage,
    required IconData icon,
    bool readOnly = false,
    TextInputType textInputType = TextInputType.number}) {
  return Container(
    width: width == 50 ? Get.width - 75 : width,
    decoration: AppDecoration.inputBoxDecorationShadow(),
    child: TextFormField(
      readOnly: readOnly,
      style: AppStyle.textFormFieldStyle(fontSize: width * 0.05),
      keyboardType: textInputType,
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
