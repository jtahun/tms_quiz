import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tms_quiz/src/core/routing/app_router.gr.dart';
import 'package:tms_quiz/src/core/widgets/app_bar.dart';
import 'package:tms_quiz/src/core/widgets/button.dart';
import 'package:tms_quiz/src/core/widgets/text_field.dart';
import 'package:tms_quiz/src/user/state/user_state.dart';

@RoutePage()
class SignupScreen extends StatefulWidget {

  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  final _confirmPasswordController = TextEditingController();

  final _nameController = TextEditingController();

  void _navigateLogin(BuildContext context){
    AutoRouter.of(context).replace(const LoginRoute());
  }

  void _signup() async {
    try{
      await UserState.of(context).notifier!.createAccount(
      email: _emailController.text,
      password: _passwordController.text,
      name: _nameController.text,
    );
    }catch(error){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            error.toString(),
            ),
          backgroundColor: Colors.red,
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xFFEFEFEF),
      appBar:  OwnAppBar(
        text: 'Quizfire',
        actions: [
          TextButton(
            onPressed: () => _navigateLogin(context),
            child: const Text('Log in'),
            ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children:  [
          Text(
            'Create new account',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 48,),
          OwnTextField(
            controller: _emailController,label: 'Email', placeholder: 'Enter your email',
          ),
          const SizedBox(height: 16,),
          OwnTextField(controller: _passwordController, label: 'Password', placeholder: 'Enter your password',),
          const SizedBox(height: 16,),
          OwnTextField(controller: _confirmPasswordController, label: 'Confirm password', placeholder: 'Enter your password again',),
          const SizedBox(height: 16,),
          OwnTextField(controller: _nameController, label: 'Name', placeholder: 'Enter your name',),
          const SizedBox(height: 32,),
          Button(text: 'Sign up', onPressed: _signup),
        ],),
    );
  }
}