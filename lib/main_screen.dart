import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mini_project/page/analytic_page.dart';
import 'package:mini_project/page/dashboard_page.dart';
import 'package:mini_project/page/profile_page.dart';
import 'package:mini_project/page/work_log_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int bottomNavIndex = 0;
  String token = "";
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: bottomNavIndex);
  }

  final List<Widget> _listWidget = [
    DashboardPage(),
    WorkLogPage(),
    AnalyticPage(),
    ProfilePage(),
  ];

  final List<BottomNavigationBarItem> _bottomNavBarItems = [
    BottomNavigationBarItem(
      icon: Container(
        padding: const EdgeInsets.all(4),
        child: const FaIcon(FontAwesomeIcons.house, size: 20),
      ),
      activeIcon: Container(
        padding: const EdgeInsets.all(4),
        child: const FaIcon(FontAwesomeIcons.house, size: 20),
      ),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Container(
        padding: const EdgeInsets.all(4),
        child: const FaIcon(FontAwesomeIcons.briefcase, size: 20),
      ),
      activeIcon: Container(
        padding: const EdgeInsets.all(4),
        child: const FaIcon(FontAwesomeIcons.briefcase, size: 20),
      ),
      label: 'Work Log',
    ),
    BottomNavigationBarItem(
      icon: Container(
        padding: const EdgeInsets.all(4),
        child: const FaIcon(FontAwesomeIcons.chartArea, size: 20),
      ),
      activeIcon: Container(
        padding: const EdgeInsets.all(4),
        child: const FaIcon(FontAwesomeIcons.chartArea, size: 20),
      ),
      label: 'Analytic',
    ),
    BottomNavigationBarItem(
      icon: Container(
        padding: const EdgeInsets.all(4),
        child: const FaIcon(Icons.more_horiz, size: 20),
      ),
      activeIcon: Container(
        padding: const EdgeInsets.all(4),
        child: const Icon(Icons.more_horiz, size: 20),
      ),
      label: 'Profile',
    ),
  ];

  void _onBottomNavBarTapped(int index) {
    setState(() {
      bottomNavIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  void _onPageChanged(int index) {
    setState(() {
      bottomNavIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Scaffold(
        body: PageView(
          controller: _pageController,
          onPageChanged: _onPageChanged,
          physics: const PageScrollPhysics(), // Mengaktifkan efek scroll
          children: _listWidget,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: isDark ? Colors.black : Colors.white,
        selectedItemColor: isDark ? Colors.white : Colors.black,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: bottomNavIndex,
        items: _bottomNavBarItems,
        onTap: _onBottomNavBarTapped,
      ),
    );
  }
}
