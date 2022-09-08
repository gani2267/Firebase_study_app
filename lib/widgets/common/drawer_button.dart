import 'package:flutter/material.dart';

class DrawerButton extends StatelessWidget {
  const DrawerButton(
      {Key? key,
      required this.icon,
      required this.label,
      required this.onPressed})
      : super(key: key);

  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: 15,
        ),
        label: Text(label));
  }
}
