import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabChange;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GNav(
        selectedIndex: currentIndex, 
        onTabChange: onTabChange,
        padding: const EdgeInsets.all(10),
        color: Colors.grey[400],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        activeColor: Theme.of(context).colorScheme.secondary,
        tabBackgroundColor: Colors.grey.shade300,
        tabBorderRadius: 16,
        tabActiveBorder: Border.all(color: Colors.white),
        tabs: const [
          GButton(
            icon: FontAwesomeIcons.house,
            text: ' Home',
            iconSize: 20,
          ),
          GButton(
            icon: FontAwesomeIcons.magnifyingGlass,
            text: 'Search',
            iconSize: 20,
          ),
          GButton(
            icon: FontAwesomeIcons.earthAfrica,
            text: ' Countries',
            iconSize: 20,
          ),
        ],
      ),
    );
  }
}
