import 'package:flutter/material.dart';

class LockedNotesPageView extends StatefulWidget {
  const LockedNotesPageView({final Key? key}) : super(key: key);

  @override
  State<LockedNotesPageView> createState() => _LockedNotesPageViewState();
}

class _LockedNotesPageViewState extends State<LockedNotesPageView> with TickerProviderStateMixin {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();

    super.initState();
  }

  @override
  Widget build(final BuildContext context) => CustomScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 32, 24, 16),
              child: Text(
                'Cooming Soon',
                style: Theme.of(context).textTheme.headline4?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ),
          ),
        ],
      );
}
