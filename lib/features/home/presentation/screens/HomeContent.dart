// home_content.dart
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../config/constants/textStyles.dart';
import '../widgets/home_popular_rest.dart';
import '../widgets/home_services.dart';
import '../widgets/home_shotcuts.dart';
import '../widgets/home_user_info.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final PageController _pageController = PageController();

    return ListView(
      padding: EdgeInsets.zero,
      children: [
        // ✅ User Info
        UserInfoWidget.userInfo(
          size: size,
          name: FirebaseAuth.instance.currentUser?.email ?? "guest",
          place: "Shebin Elkom",
        ),

        // ✅ Services
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
                context: context,
                size: size,
                imagePath: "assets/images/food.png",
                offer: "Up to 50%",
                catigory: "Food",
              ),
              HomeService.getService(
                context: context,
                size: size,
                imagePath: "assets/images/health.png",
                offer: "20 mins",
                catigory: "health",
              ),
              HomeService.getService(
                context: context,
                size: size,
                imagePath: "assets/images/grocary.png",
                offer: "15 mins",
                catigory: "grocery",
              ),
            ],
          ),
        ),

        // ✅ Got a Code
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

        // ✅ Shortcuts
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

        // ✅ PageView
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
            effect: const ColorTransitionEffect(
              dotColor: Colors.black26,
              activeDotColor: Color(0xff8900FE),
            ),
          ),
        ),

        // ✅ Popular restaurants
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
    );
  }
}
