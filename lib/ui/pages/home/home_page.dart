import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../../components/components.dart';
import '../pages.dart';

class HomePage extends StatefulWidget {
  final HomePresenter presenter;

  static const String routeName = '/home';

  const HomePage({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late int _selectedIndex;
  late ScrollController _scrollController;
  late PageController _pageController;
  late TabController _homeTabController;

  @override
  void initState() {
    _selectedIndex = 0;
    _scrollController = ScrollController();
    _pageController = PageController();
    _homeTabController = TabController(length: 2, vsync: this);

    super.initState();
  }

  void _handleSelectedIndex(int value) {
    setState(() {
      _selectedIndex = value;
    });
    _pageController.animateToPage(
      value,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
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
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.toNamed('/note'),
          elevation: 0.0,
          child: const Icon(IconlyLight.paper_plus),
          backgroundColor: Colors.grey.shade900,
        ),
        bottomNavigationBar: SlideBottomNavigationBar(
          selectedIndex: _selectedIndex,
          handleSelectedIndex: _handleSelectedIndex,
        ),
        body: SafeArea(
          child: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              HomePageView(
                scrollController: _scrollController,
                tabController: _homeTabController,
              ),
              HomePageView(
                scrollController: _scrollController,
                tabController: _homeTabController,
              ),
              HomePageView(
                scrollController: _scrollController,
                tabController: _homeTabController,
              ),
              HomePageView(
                scrollController: _scrollController,
                tabController: _homeTabController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SlideBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) handleSelectedIndex;

  const SlideBottomNavigationBar({
    Key? key,
    required this.selectedIndex,
    required this.handleSelectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(32.0)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedNavBarItem(
              index: 0,
              selectedIndex: selectedIndex,
              handleSelectedItem: handleSelectedIndex,
              label: 'Home',
              icon: IconlyLight.home,
            ),
            AnimatedNavBarItem(
              index: 1,
              selectedIndex: selectedIndex,
              handleSelectedItem: handleSelectedIndex,
              label: 'Locked',
              icon: IconlyLight.lock,
            ),
            AnimatedNavBarItem(
              index: 2,
              selectedIndex: selectedIndex,
              handleSelectedItem: handleSelectedIndex,
              label: 'Categories',
              icon: IconlyLight.folder,
            ),
            AnimatedNavBarItem(
              index: 3,
              selectedIndex: selectedIndex,
              handleSelectedItem: handleSelectedIndex,
              label: 'Profile',
              icon: IconlyLight.profile,
            ),
          ],
        ),
      ),
    );
  }
}

class HomePageView extends StatefulWidget {
  final ScrollController scrollController;
  final TabController tabController;

  const HomePageView({
    Key? key,
    required this.scrollController,
    required this.tabController,
  }) : super(key: key);

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  void handleSelectedTab(int index) {
    setState(() {
      widget.tabController.animateTo(
        index,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: widget.scrollController,
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24.0, 32.0, 24.0, 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Hi, ',
                        style: GoogleFonts.poppins(
                          fontSize: 28.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      TextSpan(
                        text: 'Gabriel Scotá',
                        style: GoogleFonts.poppins(
                          fontSize: 28.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade900,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  IconlyLight.search,
                  size: 28.0,
                  color: Colors.grey.shade900,
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: Colors.grey.shade200,
            ),
            margin: const EdgeInsets.symmetric(horizontal: 24.0),
            padding: const EdgeInsets.all(6.0),
            child: TabBar(
              controller: widget.tabController,
              indicatorColor: Colors.green,
              tabs: const [
                Tab(
                  text: "Notes",
                ),
                Tab(
                  text: "Favorites",
                ),
              ],
              onTap: handleSelectedTab,
              labelColor: const Color(0xFFFCFCFC),
              labelStyle: GoogleFonts.poppins(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
              ),
              unselectedLabelColor: Colors.grey.shade900,
              indicator: RectangularIndicator(
                bottomLeftRadius: 10.0,
                bottomRightRadius: 10.0,
                topLeftRadius: 10.0,
                topRightRadius: 10.0,
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'List notes',
                    style: GoogleFonts.poppins(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade900,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'All notes',
                      style: GoogleFonts.poppins(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(width: 12.0),
                    Icon(
                      IconlyLight.filter,
                      size: 20.0,
                      color: Colors.grey.shade900,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 32.0),
          sliver: LiveSliverGrid(
            controller: widget.scrollController,
            itemBuilder: (context, index, animation) => FadeTransition(
              opacity: Tween<double>(
                begin: 0,
                end: 1,
              ).animate(animation),
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, -0.1),
                  end: Offset.zero,
                ).animate(animation),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: widget.tabController.index == 0 ? AppColors.pastelLightBlue : AppColors.pastelLightRed,
                  ),
                ),
              ),
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12.0,
              mainAxisSpacing: 12.0,
              childAspectRatio: 0.8,
            ),
            itemCount: widget.tabController.index == 0 ? 5 : 8,
            showItemDuration: const Duration(milliseconds: 300),
            showItemInterval: const Duration(milliseconds: 100),
          ),
        )
      ],
    );
  }
}

class AnimatedNavBarItem extends StatefulWidget {
  final int index;
  final int selectedIndex;
  final Function(int) handleSelectedItem;
  final String label;
  final IconData icon;

  const AnimatedNavBarItem({
    Key? key,
    required this.index,
    required this.selectedIndex,
    required this.handleSelectedItem,
    required this.label,
    required this.icon,
  }) : super(key: key);

  @override
  _AnimatedNavBarItemState createState() => _AnimatedNavBarItemState();
}

class _AnimatedNavBarItemState extends State<AnimatedNavBarItem> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _offsetEnabled;
  late final Animation<Offset> _offsetSelected;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 400));
    _offsetEnabled = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.0, -2),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 1.0),
      ),
    );
    _offsetSelected = Tween<Offset>(
      begin: const Offset(0.0, 2),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 1.0),
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.selectedIndex == widget.index) {
      _controller.forward();
    } else {
      _controller.reverse();
    }

    return Expanded(
      key: ValueKey(widget.index),
      child: GestureDetector(
        onTap: () => widget.handleSelectedItem(widget.index),
        child: AnimatedBuilder(
            animation: _controller,
            builder: (context, _) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  SlideTransition(
                    position: _offsetEnabled,
                    child: Icon(
                      widget.icon,
                      size: 28.0,
                      color: const Color(0xFFFCFCFC).withOpacity(0.4),
                    ),
                  ),
                  SlideTransition(
                    position: _offsetSelected,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          widget.label,
                          style: GoogleFonts.poppins(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFFFCFCFC),
                          ),
                        ),
                        Container(
                          height: 8.0,
                          width: 8.0,
                          margin: const EdgeInsets.only(top: 6.0),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFFCFCFC),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
