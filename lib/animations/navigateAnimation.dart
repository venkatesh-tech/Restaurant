import 'package:flutter/material.dart';
// import 'package:restaurant/values/values.dart';

class RotationRoute extends PageRouteBuilder {
  final Widget page;

  RotationRoute(this.page)
      : super(
            pageBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) =>
                page,
            transitionDuration: Duration(milliseconds: 1000),
            transitionsBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child,
            ) =>
                RotationTransition(
                    turns: Tween<double>(begin: 0.0, end: 1.0).animate(
                        CurvedAnimation(
                            parent: animation, curve: Curves.bounceInOut)),
                    child: child));
}
