import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      color: outline == true ? null : const  Color(0xFF076A67),
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap:onPressed,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: const Color(0xFF076A67),
              width: 2 
            )
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: outline ? const Color(0xFF076A67) : Colors.white,
              fontSize:16,
        
            )
            ),
        ),
      ),
    );
  }
}