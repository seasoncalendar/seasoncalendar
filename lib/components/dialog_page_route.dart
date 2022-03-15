import 'package:flutter/material.dart';


/// a page route that is able to properly work with elements like Hero.
/// Pass a AlertDialog builder to get a Dialog that works with Hero elements.
class DialogPageRoute<T> extends PageRoute<T> {
  final WidgetBuilder builder;

  DialogPageRoute({ required this.builder }) : super();

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  bool get maintainState => true;

  @override
  Color get barrierColor => Colors.black54;

  @override
  String? get barrierLabel => "dismiss";

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
        opacity: CurvedAnimation(
            parent: animation,
            curve: Curves.easeOut
        ),
        child: child
    );
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return builder(context);
  }
}