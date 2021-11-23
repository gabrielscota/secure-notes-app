import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

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

class _HomePageState extends State<HomePage> {
  late int _selectedIndex;
  late ScrollController scrollController;

  @override
  void initState() {
    _selectedIndex = 0;
    scrollController = ScrollController();

    super.initState();
  }

  void handleSelectedIndex(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: const Color(0xFFFCFCFC).withOpacity(0.0),
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.grey.shade900,
        // systemNavigationBarContrastEnforced: true,
        systemNavigationBarDividerColor: Colors.grey.shade900,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );

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
        bottomNavigationBar: ClipRRect(
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
                  selectedIndex: _selectedIndex,
                  handleSelectedItem: handleSelectedIndex,
                  label: 'Home',
                  icon: IconlyLight.home,
                ),
                AnimatedNavBarItem(
                  index: 1,
                  selectedIndex: _selectedIndex,
                  handleSelectedItem: handleSelectedIndex,
                  label: 'Locked',
                  icon: IconlyLight.lock,
                ),
                AnimatedNavBarItem(
                  index: 2,
                  selectedIndex: _selectedIndex,
                  handleSelectedItem: handleSelectedIndex,
                  label: 'Categories',
                  icon: IconlyLight.folder,
                ),
                AnimatedNavBarItem(
                  index: 3,
                  selectedIndex: _selectedIndex,
                  handleSelectedItem: handleSelectedIndex,
                  label: 'Profile',
                  icon: IconlyLight.profile,
                ),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: DefaultTabController(
            length: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: CustomScrollView(
                controller: scrollController,
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 32.0, bottom: 16.0),
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
                      padding: const EdgeInsets.all(6.0),
                      child: TabBar(
                        indicatorColor: Colors.green,
                        tabs: const [
                          Tab(
                            text: "Notes",
                          ),
                          Tab(
                            text: "Favorites",
                          ),
                        ],
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
                      margin: const EdgeInsets.symmetric(vertical: 24.0),
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
                    padding: const EdgeInsets.only(bottom: 24.0),
                    sliver: LiveSliverGrid(
                      controller: scrollController,
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
                              color: const Color(0xFFFFC5BF).withOpacity(0.5),
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
                      itemCount: 5,
                      showItemDuration: const Duration(milliseconds: 300),
                      showItemInterval: const Duration(milliseconds: 100),
                    ),
                  ),
                  // Expanded(
                  //   child: StaggeredGridView.builder(
                  //     gridDelegate: SliverStaggeredGridDelegateWithFixedCrossAxisCount(
                  //       crossAxisCount: 2,
                  //       staggeredTileBuilder: (index) => const StaggeredTile.count(2, 1),
                  //       crossAxisSpacing: 12.0,
                  //       mainAxisSpacing: 12.0,
                  //       staggeredTileCount: 4,
                  //     ),
                  //     physics: const BouncingScrollPhysics(),
                  //     padding: const EdgeInsets.only(bottom: 24.0),
                  //     itemCount: 4,
                  //     itemBuilder: (context, index) => Container(
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(16.0),
                  //         color: const Color(0xFFFFC5BF).withOpacity(0.5),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
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
