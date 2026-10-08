import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:tms_quiz/src/core/constants/theme_constants.dart';

import 'package:tms_quiz/src/quiz/models/quiz_result.dart';

import 'package:tms_quiz/src/quiz/widgets/result_header.dart';
import 'package:tms_quiz/src/quiz/widgets/result_leaderboard.dart';
import 'package:tms_quiz/src/quiz/widgets/result_summary.dart';

@RoutePage()
class QuizResultScreen extends StatefulWidget {
  final QuizResult result;

  const QuizResultScreen({super.key, required this.result});

  @override
  State<QuizResultScreen> createState() => _QuizResultScreenState();
}

class _QuizResultScreenState extends State<QuizResultScreen> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeConstants.primaryColor,

      body: SafeArea(
        bottom: false,

        child: Column(
          children: [
            ResultHeader(
              onBack: () => AutoRouter.of(context).maybePop(),

              selectedTab: _selectedTab,

              onTabSelected: (tab) => setState(() => _selectedTab = tab),
            ),

            Expanded(
              child: Container(
                width: double.infinity,

                clipBehavior: Clip.antiAlias,

                decoration: const BoxDecoration(
                  color: ThemeConstants.backgroundColor,

                  borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
                ),

                child: _selectedTab == 0
                    ? ResultSummary(result: widget.result)
                    : const ResultLeaderboard(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
