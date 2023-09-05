import 'package:flutter_frontend/presentation/user_profile_screen/controller/user_profile_controller.dart';
import 'package:flutter_frontend/core/app_export.dart';

class UserProfileScreen extends GetWidget<UserProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.arrow_back_ios_new_rounded),
                    customText(
                      color: blackColor,
                      fontSize: width * 0.06,
                      text: "Profile Section",
                    ),
                    const Icon(Icons.mode_edit_rounded),
                  ],
                ),
                SizedBox(
                  height: height * 0.06,
                ),
                Row(
                  children: [
                    Container(
                      decoration: AppDecoration.containerBoxDecoration(
                          borderRadius: 12),
                      child: customImageView(
                          url: controller.userProfileModel.profileURL.isEmpty
                              ? defaultProfileImage
                              : controller.userProfileModel.profileURL,
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
                          text: controller.userProfileModel.name,
                          fontSize: width * 0.08,
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        customText(
                            text:
                                "Email: ${controller.userProfileModel.emailAddress}"),
                        customText(
                            text:
                                "Mobile: ${controller.userProfileModel.mobile}"),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                titleBuilder(title: "Projects"),
                const SizedBox(
                  height: 20,
                ),
                ListView.separated(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                customText(
                                  text: controller
                                      .portfolio.projects[index].title,
                                  fontWeight: FontWeight.bold,
                                  fontSize: width * 0.05,
                                  color: primaryColor,
                                ),
                                customText(
                                    text: controller
                                        .portfolio.projects[index].date
                                        .toString(),
                                    fontSize: width * 0.04,
                                    textAlign: TextAlign.justify),
                              ],
                            ),
                            customText(
                                text: controller
                                    .portfolio.projects[index].description,
                                fontSize: width * 0.04,
                                textAlign: TextAlign.justify),
                            const SizedBox(
                              height: 10,
                            ),
                            customText(
                                text: "Technology Used:",
                                fontSize: width * 0.04,
                                textAlign: TextAlign.justify),
                            SizedBox(
                              height: width * 0.04,
                              child: ListView.separated(
                                  physics: const ClampingScrollPhysics(),
                                  padding: const EdgeInsets.only(left: 20),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, childIndex) =>
                                      customText(
                                          text: controller
                                              .portfolio
                                              .projects[index]
                                              .technology[childIndex],
                                          fontSize: width * 0.04,
                                          textAlign: TextAlign.justify),
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                        width: 5,
                                      ),
                                  itemCount: controller.portfolio
                                      .projects[index].technology.length),
                            )
                          ],
                        ),
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    itemCount: controller.portfolio.projects.length),
                const SizedBox(
                  height: 20,
                ),
                titleBuilder(title: "Skills"),
                const SizedBox(
                  height: 20,
                ),
                GridView.builder(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.portfolio.skills.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 4 / 1,
                    crossAxisSpacing: 25,
                    mainAxisSpacing: 15,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      alignment: Alignment.center,
                      height: height * 0.15,
                      width: width * 0.42,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: customText(
                        color: Colors.deepPurple.shade700,
                        fontWeight: FontWeight.bold,
                        fontSize: width * 0.058,
                        text: controller.portfolio.skills[index].skillname,
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                titleBuilder(title: "Achievements"),
                const SizedBox(
                  height: 20,
                ),
                ListView.separated(
                  itemBuilder: (context, index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customText(
                        color: primaryColor,
                        fontSize: width * 0.058,
                        text:
                            controller.portfolio.achievements[index].title.name,
                      ),
                      customText(
                        color: greyColor,
                        fontSize: width * 0.05,
                        text: controller
                            .portfolio.achievements[index].universityName.name,
                      ),
                      customText(
                        color: greyColor,
                        fontSize: width * 0.04,
                        text:
                            controller.portfolio.achievements[index].date.name,
                      ),
                    ],
                  ),
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.portfolio.skills.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 15,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget titleBuilder({required String title}) {
  return Column(
    children: [
      Container(
        height: 1,
        color: primaryColor,
      ),
      SizedBox(
        height: height * 0.008,
      ),
      customText(
        color: blackColor,
        fontSize: width * 0.06,
        text: title,
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
