import 'package:flutter/material.dart';
import 'package:neuvoweb_assignment/utils/app_colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          // color: Colors.blue,
          gradient: AppColors.primaryBlueGradient,
          borderRadius: BorderRadius.circular(40),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _navItem("assets/bottom_navbar/img_1.png", 0),
            _navItem("assets/bottom_navbar/img_2.png", 1),

            /// CENTER BUTTON (SAME SIZE)
            _centerItem("assets/bottom_navbar/img_4.png", 2),

            _navItem("assets/bottom_navbar/img_3.png", 3),
            _navItem("assets/bottom_navbar/img_6.png", 4),
          ],
        ),
      ),
    );
  }
  Widget _centerItem(String assetPath, int index) {
    final bool isSelected = selectedIndex == index;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => onItemSelected(index),
      child: SizedBox(
        width: 45,
        height: 45,
        child: Center(
          child: Image.asset(
            assetPath,
            width: 28,
            height: 28,
            color: isSelected ? Colors.white : Colors.white70,
            colorBlendMode: BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
  Widget _navItem(String assetPath, int index) {
    final bool isSelected = selectedIndex == index;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => onItemSelected(index),
      child: SizedBox(
        width: 45,
        height: 45,
        child: Center(
          child: Image.asset(
            assetPath,
            width: 28,
            height: 28,
            color: isSelected ? Colors.white : Colors.white70,
            colorBlendMode: BlendMode.srcIn,
            filterQuality: FilterQuality.high,
          ),
        ),
      ),
    );
  }

}