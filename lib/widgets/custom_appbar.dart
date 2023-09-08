import 'package:flutter_frontend/core/app_export.dart';

PreferredSizeWidget customAppbar({required String title}) {
  return AppBar(
    automaticallyImplyLeading: false,
    centerTitle: true,
    leading: GestureDetector(
      onTap: () => Get.back(),
      child: Icon(
        Icons.arrow_back_ios_new_rounded,
        color: blackColor,
      ),
    ),
    title: customText(
      color: blackColor,
      fontSize: width * 0.06,
      text: title,
    ),
    backgroundColor: whiteColor,
    elevation: 0,
  );
}
