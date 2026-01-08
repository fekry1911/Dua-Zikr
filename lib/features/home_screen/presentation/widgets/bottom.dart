import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

List<CurvedNavigationBarItem> bottomBarItem = [
  bottomBarItem1(icon: Icons.home, label: "الرئيسية"),
  bottomBarItem1(icon: Icons.menu_book_sharp, label: "احاديث"),
  bottomBarItem1(icon: Icons.favorite_border, label: "المفضله"),
];

CurvedNavigationBarItem bottomBarItem1({required IconData icon, required String label}) {
  return CurvedNavigationBarItem(
    child: Icon(icon, color: Colors.teal, size: 25.sp),
    label: label,
  );
}
