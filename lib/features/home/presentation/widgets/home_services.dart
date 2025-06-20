import 'package:flutter/material.dart';

import '../../../../config/constants/textStyles.dart';
import '../screens/catigory_service_screen.dart';
class HomeService {
  static Widget getService({
    required BuildContext context,
    required Size size,
    required String imagePath,
    required String offer,
    required String catigory,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryServicesScreen(category: catigory),));
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 12),
        child: Column(
          children: [
            Container(
              width: size.width * 0.22,
              height: size.width * 0.22,
              decoration: BoxDecoration(
                color: const Color(0xffF5F5F5),
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.all(10),
              child: Image.asset(imagePath, fit: BoxFit.contain),
            ),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xff8900FE),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                offer,
                style: CustomTextStyles.KregularWhite(12),
              ),
            ),
            const SizedBox(height: 6),
            Text(catigory, style: CustomTextStyles.Kregular(14)),
          ],
        ),
      ),
    );
  }
}
