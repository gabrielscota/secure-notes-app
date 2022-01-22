import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../../../../viewmodels/viewmodels.dart';
import '../../../theme/theme.dart';
import '../../pages.dart';

class HomePageView extends StatefulWidget {
  final HomePresenter presenter;
  final ScrollController scrollController;

  const HomePageView({
    final Key? key,
    required this.presenter,
    required this.scrollController,
  }) : super(key: key);

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);

    super.initState();
  }

  void handleSelectedTab(final int index) {
    setState(() {
      _tabController.animateTo(
        index,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(final BuildContext context) => CustomScrollView(
        controller: widget.scrollController,
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 32, 24, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Hi, ',
                          style: Theme.of(context).textTheme.headline4?.copyWith(
                                color: Theme.of(context).colorScheme.primary.withOpacity(0.6),
                              ),
                        ),
                        TextSpan(
                          text: 'Gabriel Scotá',
                          style: Theme.of(context).textTheme.headline4?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    IconlyLight.search,
                    size: 28,
                    color: Colors.grey.shade900,
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade200,
              ),
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.all(6),
              child: TabBar(
                controller: _tabController,
                indicatorColor: Colors.green,
                tabs: const [
                  Tab(
                    text: 'Notes',
                  ),
                  Tab(
                    text: 'Favorites',
                  ),
                ],
                onTap: handleSelectedTab,
                labelColor: Theme.of(context).colorScheme.onPrimary,
                labelStyle: Theme.of(context).textTheme.subtitle1?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                unselectedLabelColor: Colors.grey.shade900,
                indicator: RectangularIndicator(
                  bottomLeftRadius: 10,
                  bottomRightRadius: 10,
                  topLeftRadius: 10,
                  topRightRadius: 10,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'List notes',
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showBarModalBottomSheet(
                        context: context,
                        builder: (final context) => Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text('Filters'),
                            ],
                          ),
                        ),
                        expand: false,
                      );
                    },
                    child: Row(
                      children: [
                        Text(
                          'All notes',
                          style: Theme.of(context).textTheme.subtitle1?.copyWith(
                                color: Theme.of(context).colorScheme.primary.withOpacity(0.6),
                              ),
                        ),
                        const SizedBox(width: 12),
                        Icon(
                          IconlyLight.filter,
                          size: 20,
                          color: Colors.grey.shade900,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
            sliver: StreamBuilder<List<NoteViewModel>>(
              stream: widget.presenter.allNotesStream,
              builder: (final context, final snapshot) {
                if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  return LiveSliverGrid(
                    controller: widget.scrollController,
                    itemBuilder: (final context, final index, final animation) => FadeTransition(
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
                            borderRadius: BorderRadius.circular(16),
                            color: _tabController.index == 0 ? AppColors.pastelLightBlue : AppColors.pastelLightRed,
                          ),
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Visibility(
                                visible: snapshot.data![index].title.isNotEmpty,
                                child: Column(
                                  children: [
                                    Text(
                                      snapshot.data![index].title,
                                      style: Theme.of(context).textTheme.headline5,
                                    ),
                                    const SizedBox(height: 6),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  snapshot.data![index].text,
                                  style: Theme.of(context).textTheme.subtitle1,
                                  maxLines: 7,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: _tabController.index == 0 ? snapshot.data!.length : 8,
                    showItemDuration: const Duration(milliseconds: 300),
                    showItemInterval: const Duration(milliseconds: 100),
                  );
                } else {
                  return const SliverToBoxAdapter(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      );
}
