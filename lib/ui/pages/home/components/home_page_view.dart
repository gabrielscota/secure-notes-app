import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconly/iconly.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../../../../viewmodels/viewmodels.dart';
import '../../../mixins/mixins.dart';
import '../../../theme/theme.dart';
import '../../pages.dart';
import 'components.dart';

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

class _HomePageViewState extends State<HomePageView>
    with ConnectivityManager, TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);

    handleConnectivityWarning();

    widget.presenter.fetchNotes();

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
  Widget build(final BuildContext context) {
    super.build(context);
    return CustomScrollView(
      controller: widget.scrollController,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      slivers: [
        StreamBuilder<bool>(
          stream: widget.presenter.isLoadingStream,
          initialData: true,
          builder: (final context, final isLoadingSnapshot) {
            if (isLoadingSnapshot.hasData && isLoadingSnapshot.data! == true) {
              return SliverFillRemaining(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 24),
                  child: LottieBuilder.asset(
                    'lib/ui/assets/animations/infinite-loading.json',
                    width: 56,
                  ),
                ),
              );
            } else {
              return StreamBuilder<List<NoteViewModel>>(
                stream: widget.presenter.allNotesStream,
                builder: (final context, final snapshot) {
                  if (snapshot.hasError) {
                    return SliverToBoxAdapter(
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 32),
                              child: SvgPicture.asset(
                                'lib/ui/assets/illustrations/error.svg',
                                height: 192,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            Text(
                              'Oops, parece que algo de errado aconteceu ao buscar suas notas.',
                              style: Theme.of(context).textTheme.headline6?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: Theme.of(context).colorScheme.primary.withOpacity(0.6),
                                  ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 24),
                            ElevatedButton(
                              onPressed: widget.presenter.fetchNotes,
                              child: const Text('Recarregar'),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    return MultiSliver(
                      children: [
                        const HomeUserHeaderSliver(),
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
                                InkWell(
                                  onTap: () {
                                    showBarModalBottomSheet(
                                      context: context,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                                      ),
                                      bounce: false,
                                      backgroundColor: Theme.of(context).colorScheme.background,
                                      builder: (final context) => Padding(
                                        padding: const EdgeInsets.all(24),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: const [
                                            Text('Filters'),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 6),
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
                                ),
                              ],
                            ),
                          ),
                        ),
                        SliverPadding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          sliver: LiveSliverGrid(
                            controller: widget.scrollController,
                            itemBuilder: (final context, final index, final animation) => FadeTransition(
                              opacity: Tween<double>(
                                begin: 0,
                                end: 1,
                              ).animate(animation),
                              child: SlideTransition(
                                position: Tween<Offset>(
                                  begin: const Offset(0, 0.1),
                                  end: Offset.zero,
                                ).animate(animation),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: _tabController.index == 0
                                        ? AppColors.pastelLightBlue
                                        : AppColors.pastelLightRed,
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
                                              style: Theme.of(context).textTheme.headline6,
                                              maxLines: 1,
                                              softWrap: true,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            const SizedBox(height: 6),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          snapshot.data![index].text,
                                          style: Theme.of(context).textTheme.subtitle1,
                                          maxLines: snapshot.data![index].title.isNotEmpty ? 7 : 9,
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
                            itemCount: _tabController.index == 0 ? snapshot.data!.length : snapshot.data!.length,
                            showItemDuration: const Duration(milliseconds: 100),
                            showItemInterval: const Duration(milliseconds: 100),
                          ),
                        ),
                      ],
                    );
                  } else if (snapshot.hasData && snapshot.data!.isEmpty) {
                    return SliverFillRemaining(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(24, 32, 24, 0),
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
                                  Iconsax.search_normal,
                                  size: 28,
                                  color: Colors.grey.shade900,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 32),
                                    child: SvgPicture.asset(
                                      'lib/ui/assets/illustrations/empty_notes.svg',
                                      height: 192,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        const TextSpan(
                                          text: "Oops, looks like you don't have any notes yet, how about ",
                                        ),
                                        TextSpan(
                                          text: 'create',
                                          style: Theme.of(context).textTheme.headline6?.copyWith(
                                                fontWeight: FontWeight.w600,
                                              ),
                                          recognizer: TapGestureRecognizer()..onTap = widget.presenter.goToNotePage,
                                        ),
                                        const TextSpan(
                                          text: ' you first one?',
                                        ),
                                      ],
                                    ),
                                    style: Theme.of(context).textTheme.headline6?.copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: Theme.of(context).colorScheme.primary.withOpacity(0.6),
                                        ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                    return MultiSliver(
                      children: [
                        const HomeUserHeaderSliver(),
                        SliverToBoxAdapter(
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.fromLTRB(32, 80, 32, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 32),
                                  child: SvgPicture.asset(
                                    'lib/ui/assets/illustrations/empty_notes.svg',
                                    height: 192,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      const TextSpan(
                                        text: "Oops, looks like you don't have any notes yet, how about ",
                                      ),
                                      TextSpan(
                                        text: 'create',
                                        style: Theme.of(context).textTheme.headline6?.copyWith(
                                              fontWeight: FontWeight.w600,
                                            ),
                                        recognizer: TapGestureRecognizer()..onTap = widget.presenter.goToNotePage,
                                      ),
                                      const TextSpan(
                                        text: ' you first one?',
                                      ),
                                    ],
                                  ),
                                  style: Theme.of(context).textTheme.headline6?.copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: Theme.of(context).colorScheme.primary.withOpacity(0.6),
                                      ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const SliverToBoxAdapter(child: SizedBox());
                  }
                },
              );
            }
          },
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
