import 'package:flutter/material.dart';
import 'package:real_estate3_a/core/utils/app_styles.dart';

import '../../../domain/entities/bottonNavBar_Entity.dart';


class Custombottomnavbar extends StatelessWidget {
  const Custombottomnavbar({Key? key,required this.currentIndex,required this.ontapChanged}) : super(key: key);
  final int currentIndex;
  final Function(int)ontapChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
        shadows: [
          BoxShadow(
            color: Color(0x195A6CEA),
            blurRadius: 50,
            offset: Offset(0, 0),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: BottomNavBarItems.asMap().entries.map((e) {
          var index = e.key;
          var entity = e.value;
          return GestureDetector(
            onTap: () {
              ontapChanged(index);

            },
            child: NavBarItem(
              isSelected: currentIndex==index,
              bottomNavigationBarEntity: entity,
            ),
          );
        }).toList(),
      ),
    );
  }
}

class NavBarItem extends StatelessWidget {
  const NavBarItem({
    Key? key,
    required this.isSelected,
    required this.bottomNavigationBarEntity,
  }) : super(key: key);
  final bool isSelected;
  final BottomNavigationBarEntity bottomNavigationBarEntity;

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveIcon(
      icon: bottomNavigationBarEntity.activeIcon,
      text: bottomNavigationBarEntity.text,
    )
        : InActiveIcon(icon: bottomNavigationBarEntity.inActiveIcon);
  }
}

class InActiveIcon extends StatelessWidget {
  const InActiveIcon({Key? key, required this.icon}) : super(key: key);
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Icon(icon,color: Color(0xFFFF4A4A),);
  }
}

class ActiveIcon extends StatelessWidget {
  const ActiveIcon({Key? key, required this.text, required this.icon})
      : super(key: key);
  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: ShapeDecoration(
        color: Color(0xffF0C8D6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(16),
        ),
      ),
      child: Row(
        children: [
          Icon(icon, color: Color(0xFFD61355)),
          SizedBox(width: 8),
          Text(text, style: getMediumStyle(fontSize: 13, color: Colors.black)),
        ],
      ),
    );
  }
}
