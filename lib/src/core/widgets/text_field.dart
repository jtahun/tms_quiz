import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OwnTextField extends StatelessWidget {
  final String? label;
  final String? placeholder;


  const OwnTextField({
    super.key,
    this.label,
    this.placeholder
    });

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(label != null) Text(label!),
        if (label != null) const SizedBox(height: 4,),
        TextFormField(
          cursorColor: const Color(0xFF076A67),
          decoration: InputDecoration(
            hintText: placeholder,
            contentPadding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20,),
            fillColor: Colors.white,
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color:  Color(0xFF076A67),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ],
    );
  }
}