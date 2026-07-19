import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tms_quiz/src/core/routing/app_router.gr.dart';
import 'package:tms_quiz/src/core/widgets/app_bar.dart';
import 'package:tms_quiz/src/core/widgets/button.dart';
import 'package:tms_quiz/src/core/widgets/text_field.dart';
import 'package:tms_quiz/src/user/state/user_state.dart';


@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  void _navigateSignup(BuildContext context){
    AutoRouter.of(context).replace( SignupRoute());
  }

  void _login() async {
    try{
      await UserState.of(context).notifier!.login(
      email: _emailController.text,
      password: _passwordController.text,    
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
            onPressed: () => _navigateSignup(context),
            child: const Text('Sign up'),
            ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Welcome back!',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 48,),
          OwnTextField(
            controller: _emailController, label: 'Email', placeholder: 'Enter your email',
          ),
          const SizedBox(height: 16,),
          OwnTextField(controller: _passwordController,  label: 'Password', placeholder: 'Enter your password', obscureText: true,),          
          const SizedBox(height: 32,),
          Button(text: 'Log in', onPressed: _login,),
        ],),
    );
  }
}