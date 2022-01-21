import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import 'components.dart';

class SlideBottomNavigationBar extends StatefulWidget {
  final PageController pageController;

  const SlideBottomNavigationBar({
    final Key? key,
    required this.pageController,
  }) : super(key: key);

  @override
  _SlideBottomNavigationBarState createState() => _SlideBottomNavigationBarState();
}

class _SlideBottomNavigationBarState extends State<SlideBottomNavigationBar> {
  late int _selectedIndex;

  @override
  void initState() {
    _selectedIndex = 0;

    super.initState();
  }

  void _handleSelectedIndex(final int value) {
    setState(() {
      _selectedIndex = value;
    });
    widget.pageController.jumpToPage(value);
  }

  @override
  Widget build(final BuildContext context) => ClipRRect(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBottomNavigationBarItem(
                index: 0,
                selectedIndex: _selectedIndex,
                handleSelectedItem: _handleSelectedIndex,
                label: 'Home',
                icon: IconlyLight.home,
              ),
              AnimatedBottomNavigationBarItem(
                index: 1,
                selectedIndex: _selectedIndex,
                handleSelectedItem: _handleSelectedIndex,
                label: 'Locked',
                icon: IconlyLight.lock,
              ),
              AnimatedBottomNavigationBarItem(
                index: 2,
                selectedIndex: _selectedIndex,
                handleSelectedItem: _handleSelectedIndex,
                label: 'Folders',
                icon: IconlyLight.folder,
              ),
              AnimatedBottomNavigationBarItem(
                index: 3,
                selectedIndex: _selectedIndex,
                handleSelectedItem: _handleSelectedIndex,
                label: 'Profile',
                icon: IconlyLight.profile,
              ),
            ],
          ),
        ),
      );
}
