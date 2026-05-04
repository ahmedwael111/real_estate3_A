

import 'package:flutter/material.dart';

class BottomNavigationBarEntity {
  final  IconData activeIcon;
  final  IconData inActiveIcon;
  final  String text;

  BottomNavigationBarEntity(this.activeIcon, this.inActiveIcon, this.text);
}
List <BottomNavigationBarEntity> get BottomNavBarItems =>[
  BottomNavigationBarEntity(Icons.home, Icons.home_outlined, "home"),
  BottomNavigationBarEntity(Icons.shopping_cart_rounded, Icons.shopping_cart_outlined, "cart"),
  BottomNavigationBarEntity(Icons.receipt_long, Icons.receipt_long_outlined, "orders"),
  BottomNavigationBarEntity(Icons.person, Icons.person_outline, "person"),


];