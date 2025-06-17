import 'package:auvent_intership/config/constants/appSession.dart';
import 'package:flutter/material.dart';

import '../../../../config/constants/textStyles.dart';
import '../widgets/home_popular_rest.dart';
import '../widgets/home_services.dart';
import '../widgets/home_shotcuts.dart';
import '../widgets/home_user_info.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int bottomNav = 0;
  //
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          /// ✅ User Header
          UserInfoWidget.userInfo(size: size,name: "omar",place: "shebein Elkom"),

          /// ✅ Services Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text("Services:", style: CustomTextStyles.Kregular(22)),
          ),
          SizedBox(
            height: size.height * 0.22,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                HomeService.getService(
                    size: size,
                    imagePath: "assets/images/food.png",
                    offer: "Up to 50%",
                    serviceName: "Food"),
                HomeService.getService(
                    size: size,
                    imagePath: "assets/images/health.png",
                    offer: "20 mins",
                    serviceName: "Health & Wellness"),
                HomeService.getService(
                    size: size,
                    imagePath: "assets/images/grocary.png",
                    offer: "15 mins",
                    serviceName: "Groceries"),
              ],
            ),
          ),

          /// ✅ Got a code
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              width: size.width,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color(0xFF8900FE),
                  width: 1.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Got a code!",
                      style: CustomTextStyles.Kregular(18)
                          .copyWith(color: Color(0xFF8900FE))),
                  const SizedBox(height: 6),
                  Text("Add your code and save on your order",
                      style: CustomTextStyles.Kregular(14)
                          .copyWith(color: Colors.grey[700])),
                ],
              ),
            ),
          ),

          /// ✅ Shortcuts Section
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 5),
            child: Text("Shortcuts:", style: CustomTextStyles.Kregular(22)),
          ),
          SizedBox(
            height: size.height * 0.1,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                HomeShortCuts.buildShortcutChip("Past orders", Icons.history),
                HomeShortCuts.buildShortcutChip("Super Saver", Icons.local_offer),
                HomeShortCuts.buildShortcutChip("Must-tries", Icons.star),
                HomeShortCuts.buildShortcutChip("Give Back", Icons.favorite),
                HomeShortCuts.buildShortcutChip("Best Sellers", Icons.thumb_up),
              ],
            ),
          ),

          /// ✅ PageView Section (Indicators)
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              height: size.height * 0.18,
              child: PageView(
                controller: _pageController,
                children: [
                  Image.asset("assets/images/indicator.png", fit: BoxFit.cover),
                  Image.asset("assets/images/indicator.png", fit: BoxFit.cover),
                  Image.asset("assets/images/indicator.png", fit: BoxFit.cover),
                ],
              ),
            ),
          ),
          Center(
            child: SmoothPageIndicator(
              controller: _pageController,
              count: 3,
              effect: ColorTransitionEffect(
                dotColor: Colors.black26,
                activeDotColor: Color(0xff8900FE),
              ),
            ),
          ),

          /// ✅ Popular restaurants
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text("Popular restaurants nearby:",
                style: CustomTextStyles.Kregular(22)),
          ),
          SizedBox(
            height: size.height * 0.22,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 20),
              children: [
                PopularNearRestaurant.getPopular(
                  size: size,
                  path: "assets/images/rest1.png",
                  name: "Allo Beirut",
                  time: "32 mins",
                ),
                PopularNearRestaurant.getPopular(
                  size: size,
                  path: "assets/images/rest2.png",
                  name: "Laffah",
                  time: "25 mins",
                ),
                PopularNearRestaurant.getPopular(
                  size: size,
                  path: "assets/images/rest3.png",
                  name: "Falafil AlRabiah...",
                  time: "32 mins",
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),

      /// ✅ Bottom Nav Bar
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
