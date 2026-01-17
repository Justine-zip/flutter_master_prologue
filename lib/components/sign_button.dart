import 'package:flutter/material.dart';

class SignButton extends StatelessWidget {
  final IconData signIcon;
  final String title;
  final Radius topL;
  final Radius topR;
  final Radius bottomL;
  final Radius bottomR;
  final VoidCallback? onTap;

  const SignButton({
    super.key,
    required this.signIcon,
    required this.title,
    this.topL = Radius.zero,
    this.topR = Radius.zero,
    this.bottomL = Radius.zero,
    this.bottomR = Radius.zero,
    this.onTap,
  });

  BorderRadius get _borderRadius => BorderRadius.only(
    topLeft: topL,
    topRight: topR,
    bottomLeft: bottomL,
    bottomRight: bottomR,
  );

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: _borderRadius,
      child: InkWell(
        borderRadius: _borderRadius, // 👈 CLIPS RIPPLE
        splashColor: Colors.blueAccent.withValues(alpha: .2),
        highlightColor: Colors.blueAccent.withValues(alpha: .2),
        onTap: onTap,
        child: SizedBox(
          height: 120,
          width: 120,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(signIcon, color: Colors.blueAccent, size: 60),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
