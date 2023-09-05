import 'package:flutter_frontend/presentation/portfolio_screen/controller/portfolio_controller.dart';
import 'package:flutter_frontend/core/app_export.dart';

class PortfolioScreen extends GetWidget<PortfolioController> {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: whiteColor,
        actions: [
          GestureDetector(
            onTap: () => Get.toNamed(AppRoutes.editProfileScreen),
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Icon(
                Icons.edit,
                color: blackColor,
              ),
            ),
          )
        ],
        title: Row(
          children: [
            customImageView(
              url: appLogo,
              imgHeight: width * 0.07,
              imgWidth: width * 0.07,
              isAssetImage: true,
            ),
            SizedBox(
              width: width * 0.02,
            ),
            customText(
                color: blackColor,
                fontSize: width * 0.06,
                text: "Blogfolio",
                fontWeight: FontWeight.bold),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
            height: height,
            width: width,
            padding: const EdgeInsets.all(20),
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Get.toNamed(AppRoutes.profileScreen),
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      width: width,
                      decoration: AppDecoration.containerBoxDecoration(
                          borderRadius: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customText(
                            text: "Anand Patel",
                            fontWeight: FontWeight.bold,
                            fontSize: width * 0.07,
                            color: primaryColor,
                          ),
                          SizedBox(
                            height: height * 0.005,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              customText(
                                text: "anand@gmail.com",
                                fontWeight: FontWeight.bold,
                                fontSize: width * 0.04,
                                color: greyColor,
                              ),
                              customText(
                                text: "7069144776",
                                fontWeight: FontWeight.bold,
                                fontSize: width * 0.04,
                                color: greyColor,
                              ),
                            ],
                          ),
                          customDivider(dHeight: 5),
                          customText(text: "Projects: 1"),
                          customDivider(),
                          customText(text: "Skills: 15"),
                          customDivider(),
                          customText(text: "Achievement: 3"),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                      height: height * 0.011,
                    ),
                itemCount: 3)),
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}

Widget customDivider({double dHeight = 3}) {
  return Column(
    children: [
      SizedBox(
        height: dHeight,
      ),
      Container(
        height: 1,
        color: Colors.grey.shade200,
      ),
      SizedBox(
        height: dHeight,
      ),
    ],
  );
}
