import 'package:flutter_frontend/presentation/portfolio_screen/controller/portfolio_controller.dart';
import 'package:flutter_frontend/core/app_export.dart';

class ProfileScreen extends GetWidget<PortfolioController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: customAppbar(title: "Profile"),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
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
                        customText(text: "Mobile: 7069144776"),
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
                    itemBuilder: (context, index) => customText(
                          text: "Project $index",
                          textAlign: TextAlign.start,
                          fontSize: width * 0.05,
                          color: blackColor,
                        ),
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    itemCount: 3),
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
                  itemCount: 9,
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
                        color: blueGreyColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: customText(
                        color: blueGreyColor,
                        fontWeight: FontWeight.bold,
                        fontSize: width * 0.058,
                        text: "Skill $index",
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
                  itemBuilder: (context, index) => customText(
                    color: blackColor,
                    fontSize: width * 0.058,
                    textAlign: TextAlign.start,
                    text: "Achievement $index",
                  ),
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 3,
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
      bottomNavigationBar: const BottomNavigationWidget(),
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
        color: primaryColor,
        fontWeight: FontWeight.bold,
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
