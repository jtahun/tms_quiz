import 'package:flutter/material.dart';
import 'package:tms_quiz/src/core/constants/theme_constants.dart';

class Button extends StatelessWidget {
  final String text;
  final bool outline;
  final VoidCallback? onPressed;

  const Button({
    super.key,
    required this.text,
    this.outline = false,
    this.onPressed,
    });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: outline == true ? null : ThemeConstants.primaryColor.withOpacity(
        onPressed == null ? 0.3 : 1.0
      ),
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap:onPressed,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: ThemeConstants.primaryColor,
              width: 2 
            )
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: outline ? ThemeConstants.primaryColor : Colors.white,
              fontSize:16,
        
            )
            ),
        ),
      ),
    );
  }
}