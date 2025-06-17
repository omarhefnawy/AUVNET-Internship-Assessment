import 'package:flutter/material.dart';
class HomeShortCuts {
  static Widget buildShortcutChip(String label, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 65,
            height: 56,
            decoration: BoxDecoration(
              color: const Color(0xffFFEEE6),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(icon, color: const Color(0xff8900FE), size: 30),
          ),
          const SizedBox(height: 5),
          SizedBox(
            width: 60, // نفس عرض الأيقونة علشان تمنع overflow
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
