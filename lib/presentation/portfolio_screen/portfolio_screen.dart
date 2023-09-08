import 'package:flutter_frontend/presentation/portfolio_screen/controller/portfolio_controller.dart';
import 'package:flutter_frontend/core/app_export.dart';
import 'package:flutter_frontend/presentation/portfolio_screen/model/portfolio_model.dart';

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
          ),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Logout'),
                    content: const Text('Are you sure want to logout?.'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          controller.onLogout();
                        },
                        child: const Text('Logout'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Icon(
                Icons.logout_rounded,
                color: blackColor,
              ),
            ),
          )
        ],
        title: Row(
          children: [
            Container(
              child: customImageView(
                url: appLogo,
                imgHeight: height * 0.06,
                imgWidth: height * 0.06,
                isAssetImage: true,
              ),
            ),
            SizedBox(
              width: width * 0.02,
            ),
            customText(
              color: blackColor,
              fontSize: height * 0.04,
              text: "Blogfolio",
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          height: height,
          width: width,
          child: StreamBuilder<QuerySnapshot>(
            stream: controller.portfolios,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return customLoadingAnimation(
                    size: height * 0.08, color: primaryColor);
              }
              return ListView.separated(
                padding: const EdgeInsets.all(20),
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  Map<String, dynamic> userPortfolio =
                      snapshot.data!.docs[index].data() as Map<String, dynamic>;
                  return GestureDetector(
                    onTap: () {
                      controller.portfolioModel =
                          PortfolioModel.fromJson(userPortfolio);
                      Get.toNamed(AppRoutes.profileScreen);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      width: width,
                      decoration: AppDecoration.containerBoxDecoration(
                        borderRadius: 12,
                        blurRadius: 7,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration:
                                    AppDecoration.containerBoxDecoration(),
                                child: Hero(
                                  tag: "Hero ${userPortfolio['Email Address']}",
                                  child: customImageView(
                                      url: userPortfolio["Profile URL"],
                                      imgHeight: height * 0.1,
                                      imgWidth: height * 0.1,
                                      borderRadius: 12,
                                      fit: BoxFit.cover),
                                ),
                              ),
                              SizedBox(
                                width: width * 0.03,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  customText(
                                    text: userPortfolio["Name"],
                                    fontWeight: FontWeight.bold,
                                    fontSize: width * 0.08,
                                    color: primaryColor,
                                  ),
                                  customText(
                                    text: userPortfolio["Email Address"],
                                    fontSize: width * 0.05,
                                    fontWeight: FontWeight.w600,
                                    color: greyColor,
                                  ),
                                  customText(
                                    text: userPortfolio["Mobile"],
                                    fontSize: width * 0.05,
                                    fontWeight: FontWeight.w600,
                                    color: greyColor,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              roundedContainer(
                                bgColor: Colors.pink.withOpacity(0.1),
                                data:
                                    "Projects: ${userPortfolio["Projects"].length}",
                                textColor: Colors.pink.shade700,
                                containerWidth: width * 0.38,
                              ),
                              roundedContainer(
                                bgColor: Colors.deepOrange.withOpacity(0.1),
                                data:
                                    "Skills: ${userPortfolio["Skills"].length}",
                                textColor: Colors.deepOrange.shade700,
                                containerWidth: width * 0.38,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          roundedContainer(
                              bgColor: Colors.cyan.withOpacity(0.1),
                              data:
                                  "Achievement: ${userPortfolio["Achievements"].length}",
                              textColor: Colors.cyan.shade700),
                          // customDivider(dHeight: 5),
                          // customText(
                          //     text:
                          //         "Projects: ${userPortfolio["Projects"].length}"),
                          // customDivider(),
                          // customText(
                          //     text:
                          //         "Skills: ${userPortfolio["Skills"].length}"),
                          // customDivider(),
                          // customText(
                          //     text:
                          //         "Achievement: ${userPortfolio["Achievements"].length}"),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                  height: height * 0.02,
                ),
                itemCount: snapshot.data!.docs.length,
              );
            },
          ),
        ),
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

Widget roundedContainer({
  required String data,
  required Color bgColor,
  required Color textColor,
  double containerWidth = double.infinity,
}) {
  return Container(
    width: containerWidth,
    alignment: Alignment.center,
    padding: const EdgeInsets.only(top: 5, bottom: 5),
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(40),
    ),
    child: customText(
      color: textColor,
      fontWeight: FontWeight.bold,
      fontSize: width * 0.05,
      text: data,
    ),
  );
}
