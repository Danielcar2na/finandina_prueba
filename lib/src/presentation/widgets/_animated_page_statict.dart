import 'package:flutter/material.dart';

class AnimatedPageStatic extends PageRouteBuilder {
  final Widget child;

  AnimatedPageStatic(this.child)
      : super(
          pageBuilder: (context, animation, secondaryAnimation,)
        {return child;},
        transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secundaryAnimation, Widget child){
          return child;
        });

  @override
  Widget buildTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return child;
  }
}
