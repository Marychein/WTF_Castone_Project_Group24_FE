import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/inbox_screen.dart';
import '../screens/my_shop_screen.dart';
import '../screens/vendor_list_screen.dart';
import '../screens/profile_screen.dart';

class SunfiBottomNav extends StatefulWidget {
  const SunfiBottomNav({super.key});

  @override
  State<SunfiBottomNav> createState() => _SunfiBottomNavState();
}

class _SunfiBottomNavState extends State<SunfiBottomNav> {
  int indexOfPage = 0;

  final List<Widget> pages = const [
    HomeScreen(),
    InboxScreen(),
    MyShopScreen(),
    VendorListScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[indexOfPage],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: indexOfPage,
        onTap: (value) => setState(() => indexOfPage = value),

        backgroundColor: const Color(0xFFF1FBFF),
        selectedItemColor: const Color(0xFF3E7C1E),
        unselectedItemColor: Colors.black54,

        selectedLabelStyle: const TextStyle(fontSize: 11.5, fontWeight: FontWeight.w700),
        unselectedLabelStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),

        selectedIconTheme: const IconThemeData(size: 26),
        unselectedIconTheme: const IconThemeData(size: 24),

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_rounded, size: 30,), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.inbox_rounded, size: 30,), label: "Inbox"),
          BottomNavigationBarItem(icon: Icon(Icons.add_box_rounded, size: 30,), label: "My Shop"),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt_rounded, size: 30,), label: "Vendors"),
          BottomNavigationBarItem(icon: Icon(Icons.person_rounded, size: 30,), label: "Profile"),
        ],
      ),
    );
  }
}