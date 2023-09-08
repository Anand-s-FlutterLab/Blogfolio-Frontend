// Import the necessary package.
import 'package:flutter_frontend/core/app_export.dart';

// Define a stateful widget for the bottom navigation bar.
class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BottomNavigationWidgetState();
  }
}

// Define the state for the bottom navigation bar.
class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      unselectedItemColor: Colors.black54,
      selectedItemColor: primaryColor,
      unselectedIconTheme: IconThemeData(size: width * 0.05),
      selectedIconTheme: IconThemeData(size: width * 0.06),
      showSelectedLabels: true,
      selectedLabelStyle: TextStyle(
        color: primaryColor,
        fontWeight: FontWeight.bold,
      ),
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedBottomNavigationIndex,
      onTap: _onItemTapped,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: const Icon(
            Icons.business_center_outlined,
            color: Colors.grey,
          ),
          activeIcon: Icon(
            Icons.business_center_rounded,
            color: primaryColor,
          ),
          label: 'Portfolio',
          tooltip: "Portfolio",
        ),
        BottomNavigationBarItem(
          icon: Image(
            image: AssetImage(blogUnselectedIcon),
            fit: BoxFit.scaleDown,
            height: width * 0.06,
            width: width * 0.06,
          ),
          activeIcon: Image(
            image: AssetImage(blogSelectedIcon),
            fit: BoxFit.scaleDown,
            height: width * 0.06,
            width: width * 0.06,
          ),
          label: 'Blog',
          tooltip: "Blog",
        ),
        BottomNavigationBarItem(
          icon: const Icon(
            Icons.contact_page_outlined,
            color: Colors.grey,
          ),
          activeIcon: Icon(
            Icons.contact_page,
            color: primaryColor,
          ),
          label: 'Contact Form',
          tooltip: "Contact Form",
        ),
      ],
    );
  }

  // Function to handle item tap in the bottom navigation bar.
  void _onItemTapped(int index) {
    setState(() {
      selectedBottomNavigationIndex = index;
      debugPrint("Selected Index :: $selectedBottomNavigationIndex");
      _navigateToScreens(selectedBottomNavigationIndex);
    });
  }

  // Function to navigate to respective pages based on the selected index.
  void _navigateToScreens(int index) {
    if (index == 0) {
      Get.offNamed(AppRoutes.portfolioScreen);
    } else if (index == 1) {
      Get.offNamed(AppRoutes.blogScreen);
    } else if (index == 2) {
      Get.offNamed(AppRoutes.contactFormScreen);
    }
  }
}
