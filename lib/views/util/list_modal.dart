import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'empty_list_placeholder.dart';
import 'list_close_button.dart';

class ListModal extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final bool centered;
  final bool separated;
  final Widget placeholder;

  const ListModal({
    super.key,
    required this.title,
    required this.children,
    this.centered = true,
    this.separated = true,
    this.placeholder = const EmptyListPlaceholder(),
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (children.isEmpty) placeholder,
        if (children.isNotEmpty)
          ListView.separated(
            padding: EdgeInsets.zero.copyWith(
              bottom: 140 + MediaQuery.of(context).viewPadding.bottom,
              top: 56,
            ),
            itemCount: children.length,
            itemBuilder: (context, index) {
              return children[index];
            },
            separatorBuilder: (context, index) {
              if (!separated) {
                return Container();
              }

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Center(
                  child: Container(
                    height: 2,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                  ),
                ),
              );
            },
          ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).scaffoldBackgroundColor,
                  Theme.of(context).scaffoldBackgroundColor.withOpacity(0),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [
                  0.7,
                  1.0,
                ],
              ),
            ),
            child: Row(
              mainAxisAlignment:
                  centered ? MainAxisAlignment.center : MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: centered ? 24 : 28,
                    height: 1,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            bottom: 16 + MediaQuery.of(context).viewPadding.bottom,
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: ListCloseButton(
              onTap: () {
                Navigator.of(context).pop();
                HapticFeedback.lightImpact();
              },
            ),
          ),
        ),
      ],
    );
  }
}
