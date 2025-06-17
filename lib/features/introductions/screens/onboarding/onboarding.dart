import 'package:flutter/material.dart';
import 'package:auvent_intership/config/constants/appData.dart';
import 'package:auvent_intership/core/network/local/cache_helper/cache_helper.dart';
import 'customPageView.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<CustomPageViewCard> pages = [
    CustomPageViewCard(
      title: "All-in-one Delivery",
      description: "Order groceries, medicines, and meals delivered straight to your door",
    ),
    CustomPageViewCard(
      title: "User-to-User Delivery",
      description: "Send or receive items from other users quickly and easily",
    ),
    CustomPageViewCard(
      title: "Sales & Discounts",
      description: "Discover exclusive sales and deals every day",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: height * 0.04),
                SizedBox(
                  height: height * 0.35,
                  child: Stack(
                    children: [
                      Positioned(
                        top: -height * 0.275,
                        left: -width * 0.30,
                        child: Container(
                          width: width * 0.9,
                          height: width * 0.99,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: AppData.linearGradiant,
                          ),
                        ),
                      ),
                      Center(
                        child: Image.asset(
                          "assets/images/logo.png",
                          width: width * 0.70,
                        ),
                      ),
                    ],
                  ),
                ),

                /// PageView
                Expanded(
                  child: PageView(
                    controller: _controller,
                    onPageChanged: (index) => setState(() => _currentPage = index),
                    children: pages,
                  ),
                ),

                const SizedBox(height: 80), // مسافة بين PageView والزر
              ],
            ),

            /// زر التقديم أو التالي
            Positioned(
              bottom: 30,
              left: width * 0.06,
              right: width * 0.06,
              child: SizedBox(
                height: 54,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_currentPage == pages.length - 1) {
                      await CacheHelper.setData(key: "onboarding", value: true);
                      Navigator.pushReplacementNamed(context, "login");
                    } else {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppData.Kbutton,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    _currentPage == pages.length - 1 ? "Get Started" : "Next",
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
