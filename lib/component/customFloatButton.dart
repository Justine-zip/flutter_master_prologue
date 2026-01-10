import 'package:flutter/material.dart';

class Customfloatbutton extends StatelessWidget {
  Customfloatbutton({super.key, required this.onPressed, required this.icon});

  final Function()? onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(onPressed: onPressed, child: Icon(icon));
  }
}
