import 'package:flutter/material.dart';

class QuizPreview extends StatelessWidget {
  final String title;
  final int questions;
  final VoidCallback onTap;

  const QuizPreview({
    super.key,
    required this.title,
    required this.questions,
    required this.onTap,
  });

 @override
Widget build(BuildContext context) {
  return GestureDetector(
    onTap: onTap,
    behavior: HitTestBehavior.opaque,
    child: Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.blueGrey,
        ),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.4),
          blurRadius: 10,
          ),
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4,),
          Text('$questions questions'),
        ],
      ),
    ),
  );
}
}