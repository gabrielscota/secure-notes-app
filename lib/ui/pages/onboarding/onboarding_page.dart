import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../pages.dart';

class OnboardingPage extends StatefulWidget {
  final OnboardingPresenter presenter;

  const OnboardingPage({
    final Key? key,
    required this.presenter,
  }) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late TextEditingController nameEditingController;

  @override
  void initState() {
    nameEditingController = TextEditingController();

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
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  fillOverscroll: true,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                    child: Column(
                      children: [
                        Text(
                          'Please enter your name to get started.',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: nameEditingController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                  hintText: 'Name',
                                  hintStyle: Theme.of(context).textTheme.headline4?.copyWith(
                                        color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                                        fontWeight: FontWeight.w400,
                                      ),
                                  alignLabelWithHint: true,
                                  floatingLabelBehavior: FloatingLabelBehavior.never,
                                  contentPadding: EdgeInsets.zero,
                                ),
                                keyboardType: TextInputType.text,
                                style: Theme.of(context).textTheme.headline5,
                                textCapitalization: TextCapitalization.sentences,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () async {
                                  widget.presenter.saveUser();
                                  Get.back();
                                },
                                child: const Text('Start to use'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
