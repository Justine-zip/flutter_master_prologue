import 'package:flutter/material.dart';

class Mytextfield extends StatefulWidget {
  final TextEditingController text;
  final Color? color;
  final bool? isFilled;
  final bool isObscure;
  final String? hint;
  Mytextfield({
    super.key,
    required this.text,
    this.color,
    this.isFilled,
    this.hint,
    required this.isObscure,
  });

  @override
  State<Mytextfield> createState() => _MytextfieldState();
}

class _MytextfieldState extends State<Mytextfield> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.text,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: TextStyle(color: Colors.white38),
        fillColor: widget.color,
        filled: widget.isFilled,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      obscureText: widget.isObscure,
      style: TextStyle(color: Colors.white60),
    );
  }
}
