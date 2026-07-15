import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class OwnAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? text;
  final List<Widget> actions;

  const OwnAppBar({this.text, this.actions = const [], super.key});

  void _pop(BuildContext context){
    AutoRouter.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return  AppBar(
      actions: [
        ...actions,
        SizedBox(width: 20,)
      ],
      title: Text(text ?? '', style: TextStyle(
        color: Colors.black,
      )),
      centerTitle: true,
      backgroundColor: Color(0xFFEFEFEF),
      elevation: 0,
      scrolledUnderElevation: 5,
      //leading: !AutoRouter.of(context).canPop() ? null : GestureDetector(
      leading: GestureDetector(
        onTap: () => _pop(context),          
        child: const Icon(Icons.keyboard_arrow_left_rounded,
         color: Colors.black,
         size: 40,),
      ),
      
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 60);
}

