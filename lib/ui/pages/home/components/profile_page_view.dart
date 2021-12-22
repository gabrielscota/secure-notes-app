import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class ProfilePageView extends StatefulWidget {
  const ProfilePageView({Key? key}) : super(key: key);

  @override
  State<ProfilePageView> createState() => _ProfilePageViewState();
}

class _ProfilePageViewState extends State<ProfilePageView> with TickerProviderStateMixin {
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
      ],
    );
  }
}
