import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeUserHeaderSliver extends StatelessWidget {
  const HomeUserHeaderSliver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SliverToBoxAdapter(
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
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: Theme.of(context).colorScheme.primary.withOpacity(0.6),
                          ),
                    ),
                    TextSpan(
                      text: 'Gabriel Scotá',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
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
      );
}
