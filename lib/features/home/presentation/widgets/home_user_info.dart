 import 'package:flutter/material.dart';

import '../../../../config/constants/appData.dart';
import '../../../../config/constants/textStyles.dart';
class UserInfoWidget {
  static Widget userInfo({required Size size,required String place,required String name}) {
    return Container(
      width: size.width,
      height: size.height * 0.25,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
        gradient: AppData.linearGradiant,
      ),
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left side (texts)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Delivering to", style: CustomTextStyles.Kregular(18)),
              const SizedBox(height: 5),
              Text(place, style: CustomTextStyles.Kregular(20)),
              const SizedBox(height: 10),
              Text("Hi ${name}", style: CustomTextStyles.KregularWhite(15)),
            ],
          ),
          // Right side (avatar)
          const CircleAvatar(
            radius: 36,
            backgroundImage:  NetworkImage("https://i.pravatar.cc/150?img=4"),
          ),
        ],
      ),
    );
  }
}
