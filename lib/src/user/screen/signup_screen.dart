import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tms_quiz/src/core/widgets/app_bar.dart';
import 'package:tms_quiz/src/core/widgets/button.dart';
import 'package:tms_quiz/src/core/widgets/text_field.dart';

@RoutePage()
class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xFFEFEFEF),
      appBar:  OwnAppBar(
        text: 'Quizfire',
        actions: [
          TextButton(
            onPressed: (){},
            child: const Text('Log in'),
            ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          Text(
            'Create new account',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 48,),
          OwnTextField(
            label: 'Email', placeholder: 'Enter your email',
          ),
          SizedBox(height: 16,),
          OwnTextField(label: 'Password', placeholder: 'Enter your password',),
          SizedBox(height: 16,),
          OwnTextField(label: 'Confirm password', placeholder: 'Enter your password again',),
          SizedBox(height: 16,),
          OwnTextField(label: 'Name', placeholder: 'Enter your name',),
          SizedBox(height: 32,),
          Button(text: 'Sign up'),
        ],),
    );
  }
}