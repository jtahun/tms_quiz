import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tms_quiz/src/core/widgets/button.dart';

@RoutePage()
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/auth_cover.png'),
            fit:BoxFit.cover,
            ),
        ),  
        child: Column(          
          children: [
            Expanded(
              child: Container(
                color: Colors.black.withValues(alpha: 0.35),
              ),
              ),  
            Container(              
              width: MediaQuery.of(context).size.width,//double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                  ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                  const Text(
                    'Log in or Sign up',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Login or create an account to make quiz, take part in challenge and win',
                    style:TextStyle(fontSize: 16),
                  ),
                  Button(text:'Log in',onPressed:() {},),
                  const SizedBox(height: 16),
                  Button(text:'Create an account', outline: true, onPressed: () {},)
                ],),
              )
            ),
                 
          ],
        ),
      ),
    );
  }
}