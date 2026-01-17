import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_master_prologue/pages/signin_page.dart';
import 'package:page_animation_transition/animations/bottom_to_top_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 5), () {
      if (!mounted) return;
      Navigator.push(
        context,
        PageAnimationTransition(
          page: SigninPage(),
          pageAnimationType: BottomToTopTransition(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: 150,
              child: Image.asset('assets/img/GCash_Splash_Logo.png'),
            ),
          ),
          SizedBox(height: 30),
          CircularProgressIndicator(color: Colors.white),
        ],
      ),
    );
  }
}
