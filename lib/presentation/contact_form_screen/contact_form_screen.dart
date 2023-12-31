import 'package:flutter_frontend/core/app_export.dart';
import 'package:flutter_frontend/presentation/contact_form_screen/controller/contact_form_controller.dart';

class ContactFormScreen extends GetWidget<ContactFormController> {
  const ContactFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Container(
        padding: const EdgeInsets.all(20),
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.05,
              ),
              // Image at the top
              customImageView(
                url: contactUsImage,
                imgHeight: height * 0.2,
                imgWidth: height * 0.2,
                fit: BoxFit.scaleDown,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              // Title "Get In Touch"
              customText(
                color: primaryColor,
                fontSize: width * 0.1,
                fontWeight: FontWeight.bold,
                text: "Get In Touch",
              ),
              SizedBox(
                height: height * 0.04,
              ),
              // Username Input
              Container(
                decoration: AppDecoration.inputBoxDecorationShadow(),
                child: TextFormField(
                  controller: controller.nameController,
                  style: AppStyle.textFormFieldStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontSize: width * 0.05),
                  keyboardType: TextInputType.text,
                  decoration: AppDecoration().textInputDecoration(
                      hintText: "Enter Candidate Username",
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
              // Mobile Number Input
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
              // Message Input (Multiline)
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
                  maxLines: null, // Allows multiline input
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please provide a Message';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              // Submit Button
              GestureDetector(
                onTap: () => controller.addContactForm(),
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
