import 'package:flutter_frontend/core/app_export.dart';
import 'package:flutter_frontend/presentation/contact_form_screen/controller/contact_form_controller.dart';

class ContactFormScreen extends GetWidget<ContactFormController> {
  const ContactFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.1,
              ),
              customImageView(
                url: appLogo,
                imgHeight: height * 0.1,
                imgWidth: height * 0.1,
                isAssetImage: true,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              customText(
                color: primaryColor,
                fontSize: width * 0.1,
                fontWeight: FontWeight.bold,
                text: "Contact Form",
              ),
              SizedBox(
                height: height * 0.08,
              ),
              Container(
                decoration: AppDecoration.inputBoxDecorationShadow(),
                child: TextFormField(
                  controller: controller.nameController,
                  style: AppStyle.textFormFieldStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontSize: width * 0.05),
                  keyboardType: TextInputType.text,
                  decoration: AppDecoration().textInputDecoration(
                      hintText: "Enter Username Here",
                      lableText: "Username",
                      icon: Icons.person),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please provide a Username';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Container(
                decoration: AppDecoration.inputBoxDecorationShadow(),
                child: TextFormField(
                  controller: controller.mobileController,
                  style: AppStyle.textFormFieldStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontSize: width * 0.05),
                  keyboardType: TextInputType.number,
                  decoration: AppDecoration().textInputDecoration(
                      hintText: "Enter Mobile Number Here",
                      lableText: "Mobile Number",
                      icon: Icons.phone),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please provide a Mobile Number';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Container(
                decoration: AppDecoration.inputBoxDecorationShadow(),
                child: TextFormField(
                  controller: controller.messageController,
                  style: AppStyle.textFormFieldStyle(
                    color: Colors.black.withOpacity(0.6),
                    fontSize: width * 0.05,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  decoration: AppDecoration().textInputDecoration(
                    hintText: "Enter Message Here",
                    lableText: "Message",
                    icon: Icons.message,
                  ),
                  maxLines: null,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please provide a Title';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              GestureDetector(
                // onTap: () => controller.onLogin(),
                child: Container(
                  width: width,
                  padding: const EdgeInsets.only(bottom: 15, top: 15),
                  decoration: AppDecoration.buttonBoxDecoration(),
                  child: Obx(
                    () => controller.isFormSubmitting.value
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
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
