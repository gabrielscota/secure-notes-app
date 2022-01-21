import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimatedBottomNavigationBarItem extends StatefulWidget {
  final int index;
  final int selectedIndex;
  final Function(int) handleSelectedItem;
  final String label;
  final IconData icon;

  const AnimatedBottomNavigationBarItem({
    final Key? key,
    required this.index,
    required this.selectedIndex,
    required this.handleSelectedItem,
    required this.label,
    required this.icon,
  }) : super(key: key);

  @override
  _AnimatedBottomNavigationBarItemState createState() => _AnimatedBottomNavigationBarItemState();
}

class _AnimatedBottomNavigationBarItemState extends State<AnimatedBottomNavigationBarItem>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _offsetEnabled;
  late final Animation<Offset> _offsetSelected;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 400));
    _offsetEnabled = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, -2),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 1),
      ),
    );
    _offsetSelected = Tween<Offset>(
      begin: const Offset(0, 2),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 1),
      ),
    );

    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    if (widget.selectedIndex == widget.index) {
      _controller.forward();
    } else {
      _controller.reverse();
    }

    return Expanded(
      key: ValueKey(widget.index),
      child: GestureDetector(
        onTap: () => widget.handleSelectedItem(widget.index),
        child: AnimatedBuilder(
          animation: _controller,
          builder: (final context, final _) => Stack(
            alignment: Alignment.center,
            children: [
              SlideTransition(
                position: _offsetEnabled,
                child: Icon(
                  widget.icon,
                  size: 28,
                  color: const Color(0xFFFCFCFC).withOpacity(0.4),
                ),
              ),
              SlideTransition(
                position: _offsetSelected,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.label,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFFFCFCFC),
                      ),
                    ),
                    Container(
                      height: 8,
                      width: 8,
                      margin: const EdgeInsets.only(top: 6),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFFCFCFC),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
