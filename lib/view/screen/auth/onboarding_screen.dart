import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neuvoweb_assignment/view/screen/auth/auth_screen.dart';

class UnboardingScreen extends StatelessWidget {
  const UnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/app_logo.jpg',
              fit: BoxFit.cover,
            ),
          ),

          Positioned.fill(
            child: Container(
              color: const Color(0xff124A9A).withOpacity(0.75),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const Spacer(flex: 3),

                  Image.asset(
                    'assets/images/splash_bg.png',
                    width: size.width * 0.22,
                    fit: BoxFit.contain,
                  ),

                  const SizedBox(height: 24),


                  const Spacer(flex: 2),
                  Text(
                    "Choose an option to get started. You can\nadd another account at any time.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 17,
                      color: Colors.white.withOpacity(0.95),
                      fontWeight: FontWeight.w300,
                      height: 1.4,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            Get.to(()=> AuthScreen());
                          },
                          child: _outlinedButton(
                            title: "I'm a Home Owner",
                          ),
                        ),
                      ),
                      Expanded(
                        child: _outlinedsButton(
                          title: "I'm a Contractor",
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  RichText(
                    text: TextSpan(
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: Colors.white70,
                      ),
                      children: const [
                        TextSpan(text: "Already have an account? "),
                        TextSpan(
                          text: "Log in",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _outlinedButton({required String title}) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(12),bottomLeft: Radius.circular(12)),
        border: Border.all(
          color: Colors.white.withOpacity(0.7),
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
  static Widget _outlinedsButton({required String title}) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topRight: Radius.circular(12),bottomRight: Radius.circular(12)),
        border: Border.all(
          color: Colors.white.withOpacity(0.7),
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
