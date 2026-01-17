import 'package:flutter/material.dart';
import 'package:flutter_master_prologue/components/sign_button.dart';
import 'package:flutter_master_prologue/pages/home_page.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import 'package:page_animation_transition/animations/right_to_left_transition.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  bool showMpinKeypad = false;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        setState(() {
          showMpinKeypad = false;
        });
      },
      child: Scaffold(
        backgroundColor: Colors.blueAccent,
        body: Stack(children: [_mainContent(), _mpinKeypad()]),
      ),
    );
  }

  // ================= MAIN CONTENT =================
  Widget _mainContent() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final height = constraints.maxHeight;

        return SingleChildScrollView(
          physics:
              showMpinKeypad
                  ? const NeverScrollableScrollPhysics()
                  : const BouncingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: height),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 80),

                  /// LOGO
                  SizedBox(
                    width: 200,
                    child: Image.asset('assets/img/GCash_Logo.png'),
                  ),

                  const SizedBox(height: 40),

                  /// GREETING
                  const Text(
                    'Good Day!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// NUMBER BOX
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          '+63-9056554189',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Icon(Icons.multiple_stop, color: Colors.white70),
                      ],
                    ),
                  ),

                  /// BUTTONS + FOOTER (HIDES WHEN MPIN SHOWS)
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    child:
                        showMpinKeypad
                            ? Column(
                              key: const ValueKey('mpin'),
                              children: [
                                const SizedBox(height: 20),
                                Text(
                                  'Enter your MPIN',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 20),

                                SizedBox(
                                  width: 150,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    //mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.circle_outlined,
                                        color: Colors.grey[350],
                                        size: 16,
                                      ),
                                      Icon(
                                        Icons.circle_outlined,
                                        color: Colors.grey[350],
                                        size: 16,
                                      ),
                                      Icon(
                                        Icons.circle_outlined,
                                        color: Colors.grey[350],
                                        size: 16,
                                      ),
                                      Icon(
                                        Icons.circle_outlined,
                                        color: Colors.grey[350],
                                        size: 16,
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(height: 20),
                              ],
                            )
                            : Column(
                              key: const ValueKey('buttons'),
                              children: [
                                const SizedBox(height: 230),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SignButton(
                                      signIcon: Icons.fingerprint,
                                      title: 'Biometrics Login',
                                      topL: const Radius.circular(12),
                                      bottomL: const Radius.circular(12),
                                      onTap: () {},
                                    ),
                                    const SizedBox(width: .5),
                                    SignButton(
                                      signIcon: Icons.grid_3x3,
                                      title: 'MPIN Login',
                                      topR: const Radius.circular(12),
                                      bottomR: const Radius.circular(12),
                                      onTap: () {
                                        setState(() {
                                          showMpinKeypad = true;
                                        });
                                      },
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 40),
                                const Divider(color: Colors.white54),
                                const SizedBox(height: 20),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    Text(
                                      'Help Center',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Forgot MPIN?',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 20),

                                Text(
                                  'v5.95.0:1151',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white70,
                                  ),
                                ),

                                const SizedBox(height: 20),
                              ],
                            ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // ================= MPIN KEYPAD =================
  Widget _mpinKeypad() {
    return AnimatedSlide(
      offset: showMpinKeypad ? Offset.zero : const Offset(0, 1),
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeOut,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 24),
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _keypadRow(['1', '2', '3']),
              _keypadRow(['4', '5', '6']),
              _keypadRow(['7', '8', '9']),
              _keypadRow(['←', '0', '✔']),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Text(
                    'Help Center',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Forgot MPIN?',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // ================= KEYPAD ROW =================
  Widget _keypadRow(List<String> keys) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:
            keys
                .map(
                  (key) => _KeyButton(
                    label: key,
                    onTap: () {
                      if (key == '✔') {
                        Navigator.push(
                          context,
                          PageAnimationTransition(
                            page: HomePage(),
                            pageAnimationType: RightToLeftTransition(),
                          ),
                        );
                      }
                    },
                  ),
                )
                .toList(),
      ),
    );
  }
}

// ================= KEYPAD BUTTON =================
class _KeyButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _KeyButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,

      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          width: 64,
          height: 64,
          child: Center(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
