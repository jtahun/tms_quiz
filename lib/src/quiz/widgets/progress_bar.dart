import 'package:flutter/material.dart';
import 'package:tms_quiz/src/core/constants/theme_constants.dart';

class ProgressBar extends StatelessWidget {
  final int itemsAmount;
  final int currentItem;

  const ProgressBar({
    super.key,
    required this.itemsAmount,
    required this.currentItem,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text('$currentItem / $itemsAmount'),
        const SizedBox(height: 4),
        Container(
          height: 10,
          width: double.infinity,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(2),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width:
                    constraints.maxWidth *
                    (currentItem / (itemsAmount - 1)),
                decoration: BoxDecoration(
                  color: ThemeConstants.primaryColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}