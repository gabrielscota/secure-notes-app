import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../pages.dart';
import 'components/components.dart';
import 'components/slide_bottom_navigation_bar.dart';

class HomePage extends StatefulWidget {
  final HomePresenter presenter;

  const HomePage({
    final Key? key,
    required this.presenter,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();

    super.initState();
  }

  @override
  Widget build(final BuildContext context) => AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Color(0xFF212121),
          systemNavigationBarDividerColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
        child: Scaffold(
          extendBody: true,
          backgroundColor: const Color(0xFFFCFCFC),
          floatingActionButton: const AddNewNoteFloatingActionButton(),
          bottomNavigationBar: SlideBottomNavigationBar(pageController: _pageController),
          body: SafeArea(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                HomePageView(),
                LockedNotesPageView(),
                FoldersPageView(),
                ProfilePageView(),
              ],
            ),
          ),
        ),
      );
}
