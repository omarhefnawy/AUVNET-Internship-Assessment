import 'package:auvent_intership/config/constants/appData.dart';
import 'package:auvent_intership/config/constants/textStyles.dart';
import 'package:auvent_intership/core/network/local/cache_helper/cache_helper.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _pages = [
    {
      "title": "all-in-one delivery",
      "desc":
      "Order groceries, medicines, and meals delivered straight to your door",
    },
    {
      "title": "User-to-User Delivery",
      "desc": "Send or receive items from other users quickly and easily",
    },
    {
      "title": "Sales & Discounts",
      "desc": "Discover exclusive sales and deals every day",
    },
  ];

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      CacheHelper.setData(key: "onboarding", value: true);
      Navigator.pushReplacementNamed(context, 'login');
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Top section with background circle and logo
          SizedBox(
            height: height * 0.5,
            child: Stack(
              children: [
                // الدائرة الكبيرة المتدرجة طالعة من الزاوية
                Positioned(
                  top: -height * 0.15,
                  left: -width * 0.25,
                  child: Container(
                    width: width * .9,
                    height: width * .8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [AppData.Kbutton, const Color(0xffFFDE59)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                ),
                // اللوجو في المنتصف
                Center(
                  child: Image.asset(
                    "assets/logo.png",
                    width: width * 0.57,
                  ),
                ),
              ],
            ),
          ),

          // PageView
          Expanded(
            child: PageView.builder(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: _pages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.08),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _pages[index]["title"]!,
                        style: CustomTextStyles.KnormalTextStyle,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        _pages[index]["desc"]!,
                        style: CustomTextStyles.KdescreptionTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // زرار Get Started / Next
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.05,
              vertical: height * 0.015,
            ),
            child: SizedBox(
              width: double.infinity,
              height: height * 0.065,
              child: ElevatedButton(
                onPressed: ()async {
                  await  CacheHelper.setData(key: "onboarding", value: true);
                  Navigator.pushReplacementNamed(context, 'login');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppData.Kbutton,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Get Started" ,
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ),
          TextButton(onPressed: _nextPage, child:  Text(_currentPage==_pages.length-1?"Get Started" : "Next",style: CustomTextStyles.KnormalTextStyle,)),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
