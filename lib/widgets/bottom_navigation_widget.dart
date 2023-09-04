import 'package:flutter_frontend/core/app_export.dart';

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BottomNavigationWidgetState();
  }
}

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
            Icons.home_outlined,
            color: Colors.grey,
          ),
          activeIcon: Icon(
            Icons.home,
            color: primaryColor,
          ),
          label: 'Home',
          tooltip: "Home",
        ),
        BottomNavigationBarItem(
          icon: const Icon(
            Icons.person_outline,
            color: Colors.grey,
          ),
          activeIcon: Icon(
            Icons.person,
            color: primaryColor,
          ),
          label: 'Profile',
          tooltip: "Profile",
        ),
      ],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedBottomNavigationIndex = index;
      debugPrint("Selected Index :: $selectedBottomNavigationIndex");
      _navigateToScreens(selectedBottomNavigationIndex);
    });
  }

  // This will navigate to respective pages
  void _navigateToScreens(int index) {
    if (index == 0) {
      Get.offNamed(AppRoutes.homeScreen);
    } else if (index == 1) {
      debugPrint("Navigating to Completed Task");
      // Navigator.pushNamed(context, "/completedScreen");
    }
  }
}
