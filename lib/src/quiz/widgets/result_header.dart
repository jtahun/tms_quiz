import 'package:flutter/material.dart';

import 'package:tms_quiz/src/core/constants/theme_constants.dart';

class ResultHeader extends StatelessWidget {
  final VoidCallback onBack;

  final int selectedTab;

  final ValueChanged<int> onTabSelected;

  const ResultHeader({
    super.key,
    required this.onBack,
    required this.selectedTab,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeConstants.primaryColor,

      child: Column(
        children: [
          SizedBox(
            height: 52,

            child: Center(
              child: TextButton.icon(
                onPressed: onBack,

                icon: const Icon(Icons.arrow_back, size: 18),

                label: const Text('Back to quizzes'),

                style: TextButton.styleFrom(foregroundColor: Colors.white),
              ),
            ),
          ),

          Row(
            children: [
              _ResultTab(
                text: 'Answers',
                selected: selectedTab == 0,
                onTap: () => onTabSelected(0),
              ),

              _ResultTab(
                text: 'Leaderboard',
                selected: selectedTab == 1,
                onTap: () => onTabSelected(1),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ResultTab extends StatelessWidget {
  final String text;

  final bool selected;

  final VoidCallback onTap;

  const _ResultTab({
    required this.text,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,

        child: Container(
          height: 45,

          alignment: Alignment.center,

          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: selected ? Colors.white : Colors.transparent,

                width: 2,
              ),
            ),
          ),

          child: Text(
            text,

            style: TextStyle(
              color: Colors.white.withValues(alpha: selected ? 1 : 0.7),

              fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
