import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

import '../../mixins/mixins.dart';
import '../pages.dart';

class SplashPage extends StatefulWidget {
  final SplashPresenter presenter;

  const SplashPage({
    final Key? key,
    required this.presenter,
  }) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with NavigationManager {
  @override
  void initState() {
    handleNavigationWithArgs(widget.presenter.navigateToWithArgsStream, clearStack: true);

    super.initState();
  }

  @override
  Widget build(final BuildContext context) => AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Colors.transparent,
          systemNavigationBarDividerColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
        child: Scaffold(
          body: SafeArea(
            child: FutureBuilder(
              future: widget.presenter.loadCurrentUser(),
              builder: (final context, final snapshot) => Center(
                child: LottieBuilder.asset(
                  'lib/ui/assets/animations/infinite-loading.json',
                  width: 128,
                ),
              ),
            ),
          ),
        ),
      );
}
