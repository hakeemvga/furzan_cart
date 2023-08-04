import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furzan_app/Screens/OrderScreen.dart';
import 'package:furzan_app/Screens/ProductScreen.dart';
import 'package:furzan_app/Screens/ProfileScreen.dart';
import 'package:furzan_app/Screens/ShopScreen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

List<Widget> screens = const [
  ShopScreen(),
  ProductScreen(),
  OrderScreen(),
  ProfileScreen(),
];

int currentIndex = 0;

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 72.h,
        child: BottomNavigationBar(
          showUnselectedLabels: true,
          type: BottomNavigationBarType.shifting,
          selectedItemColor: const Color(0xffFFC113),
          unselectedItemColor: const Color(0xff264050),
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/homeicon.png')),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/producticon.png'),
                ),
                label: 'Product'),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/ordersicon.png'),
                ),
                label: 'Orders'),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/profileicon.png'),
                ),
                label: 'Profile'),
          ],
        ),
      ),
      body: screens[currentIndex],
    );
  }
}
