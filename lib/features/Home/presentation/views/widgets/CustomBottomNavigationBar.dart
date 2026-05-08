import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:real_estate3_a/core/utils/app_colors.dart';
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
          return Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                ontapChanged(index);
              },
              child: NavBarItem(
                isSelected: currentIndex == index,
                bottomNavigationBarEntity: entity,
              ),
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
      svgIcon: bottomNavigationBarEntity.activeIcon,
      text: bottomNavigationBarEntity.text,
    )
        : InActiveIcon(svgIcon: bottomNavigationBarEntity.inActiveIcon,text: bottomNavigationBarEntity.text,);
  }
}

class InActiveIcon extends StatelessWidget {
  const InActiveIcon({Key? key, required this.svgIcon,required this.text}) : super(key: key);
  final SvgPicture svgIcon;
  final String text;
  @override
  Widget build(BuildContext context) {
   return Container(
     child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
        children: [
          svgIcon,
               SizedBox(height: 8),
              Text(text, style: getMediumStyle(fontSize: 13, color: Colors.black)),
        ],
      ),
   );
  }
}

class ActiveIcon extends StatelessWidget {
  const ActiveIcon({Key? key, required this.text, required this.svgIcon})
      : super(key: key);
  final String text;
  final SvgPicture svgIcon;
  @override
  Widget build(BuildContext context) {
    return
      Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            svgIcon,
                 SizedBox(height: 8),
                 Text(text, style: getMediumStyle(fontSize: 13, color: AppColors.splashColor)),
          ],
        ),
      );

  }
}
