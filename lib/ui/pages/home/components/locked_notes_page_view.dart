import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

import '../../../components/components.dart';

class LockedNotesPageView extends StatefulWidget {
  const LockedNotesPageView({Key? key}) : super(key: key);

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
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
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
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 32.0),
          sliver: LiveSliverGrid(
            controller: _scrollController,
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
                    color: AppColors.pastelLightRed,
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
            itemCount: 8,
            showItemDuration: const Duration(milliseconds: 300),
            showItemInterval: const Duration(milliseconds: 100),
          ),
        )
      ],
    );
  }
}
