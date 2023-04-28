import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:iconly/iconly.dart';

import '../../pages.dart';

class AddNewNoteFloatingActionButton extends StatefulWidget {
  final HomePresenter presenter;
  final ScrollController scrollController;

  const AddNewNoteFloatingActionButton({
    Key? key,
    required this.presenter,
    required this.scrollController,
  }) : super(key: key);

  @override
  State<AddNewNoteFloatingActionButton> createState() => _AddNewNoteFloatingActionButtonState();
}

class _AddNewNoteFloatingActionButtonState extends State<AddNewNoteFloatingActionButton> {
  late bool isExtended;
  late double scrollOffset;

  @override
  void initState() {
    super.initState();

    isExtended = true;
    scrollOffset = 0.0;

    widget.scrollController.addListener(() {
      if (widget.scrollController.position.userScrollDirection == ScrollDirection.forward &&
          widget.scrollController.position.pixels > 10) {
        setState(() {
          isExtended = true;
        });
      } else if (widget.scrollController.position.userScrollDirection == ScrollDirection.reverse &&
          widget.scrollController.position.pixels <= 10) {
        setState(() {
          isExtended = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 60,
        child: FloatingActionButton.extended(
          onPressed: widget.presenter.goToNotePage,
          backgroundColor: Theme.of(context).colorScheme.primary,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          extendedPadding: const EdgeInsets.all(16),
          label: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            reverseDuration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) => FadeTransition(
              opacity: animation,
              child: SizeTransition(
                sizeFactor: animation,
                axis: Axis.horizontal,
                axisAlignment: 1,
                child: child,
              ),
            ),
            switchInCurve: Curves.easeInOut,
            switchOutCurve: Curves.easeInOut,
            child: isExtended
                ? Row(
                    children: [
                      const Icon(IconlyLight.paper_plus, size: 28),
                      const SizedBox(width: 8),
                      Text(
                        'Write',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                      ),
                    ],
                  )
                : const Icon(IconlyLight.paper_plus, size: 28),
          ),
        ),
      );
}
