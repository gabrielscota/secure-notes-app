import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.shade900,
                ),
              ),
            ),
          ),
        ],
      );
}
