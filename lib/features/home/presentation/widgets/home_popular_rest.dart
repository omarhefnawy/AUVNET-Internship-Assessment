import 'package:flutter/material.dart';

import '../../../../config/constants/textStyles.dart';
class PopularNearRestaurant {
  static Widget getPopular({
    required Size size,
    required String path,
    required String name,
    required String time,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Column(
        children: [
          Container(
            width: size.width * 0.35,
            height: size.height * 0.15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0xffF5F5F5),
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(path, fit: BoxFit.cover),
          ),
          const SizedBox(height: 6),
          Text(name, style: CustomTextStyles.Kregular(15)),
          Text(time, style: CustomTextStyles.Kregular(13)),
        ],
      ),
    );
  }
}
