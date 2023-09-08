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
                        borderRadius: 12,
                      ),
                      child: Hero(
                        tag: "Hero ${controller.portfolioModel.emailAddress}",
                        child: customImageView(
                          url: controller.portfolioModel.profileImage,
                          imgHeight: 100,
                          imgWidth: 100,
                          borderRadius: 12,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customText(
                          text: controller.portfolioModel.name,
                          fontSize: width * 0.08,
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        customText(
                            text:
                                "Email: ${controller.portfolioModel.emailAddress}"),
                        customText(
                            text:
                                "Mobile: ${controller.portfolioModel.mobile}"),
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
                customGridViewBuilder(
                  itemCount: controller.portfolioModel.projects.length,
                  backgroundColor: Colors.pink.withOpacity(0.1),
                  textColor: Colors.pink.shade600,
                  data: controller.portfolioModel.projects,
                ),
                const SizedBox(
                  height: 20,
                ),
                titleBuilder(title: "Skills"),
                const SizedBox(
                  height: 20,
                ),
                customGridViewBuilder(
                  itemCount: controller.portfolioModel.skills.length,
                  backgroundColor: Colors.orangeAccent.withOpacity(0.2),
                  textColor: Colors.orangeAccent.shade700,
                  data: controller.portfolioModel.skills,
                ),
                const SizedBox(
                  height: 20,
                ),
                titleBuilder(title: "Achievements"),
                const SizedBox(
                  height: 20,
                ),
                customGridViewBuilder(
                  itemCount: controller.portfolioModel.achievements.length,
                  backgroundColor: Colors.cyan.withOpacity(0.1),
                  textColor: Colors.cyan.shade600,
                  data: controller.portfolioModel.achievements,
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

Widget customGridViewBuilder({
  required int itemCount,
  required Color backgroundColor,
  required Color textColor,
  required List data,
}) {
  return GridView.builder(
    physics: const ClampingScrollPhysics(),
    shrinkWrap: true,
    itemCount: itemCount,
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
          color: backgroundColor,
          borderRadius: BorderRadius.circular(40),
        ),
        child: customText(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: width * 0.058,
          text: data[index],
        ),
      );
    },
  );
}
