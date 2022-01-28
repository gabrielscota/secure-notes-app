import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../mixins/mixins.dart';
import '../pages.dart';
import 'components/components.dart';

class HomePage extends StatefulWidget {
  final HomePresenter presenter;

  const HomePage({
    final Key? key,
    required this.presenter,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with NavigationManager, UIErrorManager {
  late PageController _pageController;
  late ScrollController _homePageViewScrollController;

  @override
  void initState() {
    _pageController = PageController();
    _homePageViewScrollController = ScrollController();

    handleNavigationWithArgs(widget.presenter.navigateToWithArgsStream);
    handleSnackbarErrorStream(stream: widget.presenter.snackbarErrorStream);

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
          floatingActionButton: AddNewNoteFloatingActionButton(
            presenter: widget.presenter,
            scrollController: _homePageViewScrollController,
          ),
          bottomNavigationBar: SlideBottomNavigationBar(pageController: _pageController),
          body: SafeArea(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                HomePageView(
                  presenter: widget.presenter,
                  scrollController: _homePageViewScrollController,
                ),
                const LockedNotesPageView(),
                const FoldersPageView(),
                const ProfilePageView(),
              ],
            ),
          ),
        ),
      );
}
