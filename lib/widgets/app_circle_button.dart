import 'package:flutter/material.dart';

class AppCircleButton extends StatelessWidget {
  const AppCircleButton({Key? key,
    required this.child,
    this.color,
    this.onTap,
    this.width=60
  }) : super(key: key);
  final Widget child;
  final Color? color;
  final double width;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: Colors.red.withOpacity(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(2),
            ),
          )
        ),
        child: Material(
      type: MaterialType.transparency,
      clipBehavior: Clip.hardEdge,

      child: InkWell(
        child: child,
      ),
    ));
  }
}
