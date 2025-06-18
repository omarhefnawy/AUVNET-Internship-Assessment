import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../profile/presentation/screens/profileScreen.dart';
import 'HomeContent.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int bottomNav = 0;

  final List<Widget> pages = [
    const HomeContent(),
    Center(child: Text("Categories")),
    Center(child: Text("Deliver")),
    Center(child: Text("Cart")),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[bottomNav],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomNav,
        onTap: (value) {
          setState(() => bottomNav = value);
        },
        iconSize: 30,
        selectedItemColor: const Color(0xff8900FE),
        unselectedItemColor: const Color(0xff484C52),
        selectedLabelStyle: const TextStyle(fontSize: 15),
        unselectedLabelStyle: const TextStyle(fontSize: 14),
        showUnselectedLabels: true,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.delivery_dining), label: 'Deliver'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
