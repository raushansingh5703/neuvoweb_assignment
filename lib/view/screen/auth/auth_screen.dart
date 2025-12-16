import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neuvoweb_assignment/core/widgets/custom_button.dart';

import 'otp_verification_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true;
  bool hidePassword = true;
  bool rememberMe = false;


  bool hideLoginPassword = true;
  bool hideSignUpPassword = true;
  bool hideConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: size.height * 0.35,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF0A4DBF), Color(0xFF1E6DEB)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset("assets/images/splash_bg.png",height: 33,width: 31,),

                        const SizedBox(height: 20),

                        Text(
                          "Get Started now",
                          style: GoogleFonts.inter(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),

                        const SizedBox(height: 8),

                        Text(
                          "Create an account or log in to explore about our app",
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),

                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.1),
                          blurRadius: 20,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Color(0xfff5f6f9),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            children: [
                              _tabButton("Log In", isLogin),
                              _tabButton("Sign Up", !isLogin),
                            ],
                          ),
                        ),

                        const SizedBox(height: 20),


                        isLogin ? _loginForm() : _signUpForm(),

                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tabButton(String title, bool selected) {
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => isLogin = title == "Log In"),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: selected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(15),
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
              color: selected ? Colors.black : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }

  Widget _loginForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _input("Email", "Loisbecket@gmail.com"),
        _password(
          "Password",
          hide: hideLoginPassword,
          toggle: () {
            setState(() {
              hideLoginPassword = !hideLoginPassword;
            });
          },
        ),


        Row(
          children: [
            Checkbox(value: false, onChanged: (_) {}),
            Text("Remember me", style: GoogleFonts.inter(fontSize: 13)),
            const Spacer(),
            Text(
              "Forgot Password ?",
              style: GoogleFonts.inter(
                fontSize: 13,
                color: Colors.blue,
              ),
            ),
          ],
        ),

        mainButton("Log In",
        () {
          Get.to(()=> OtpVerificationScreen());
        },),

        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(child: Divider()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "Or",
                style: GoogleFonts.inter(fontSize: 13, color: Colors.grey),
              ),
            ),
            Expanded(child: Divider()),
          ],
        ),
        const SizedBox(height: 10),
        _socialButton("assets/images/google_img.png", "Continue with Google"),
        _socialButton("assets/images/facebook_img.png", "Continue with Facebook"),
      ],
    );
  }

  Widget _signUpForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _input("Name", "Enter your name"),
        _input("Email", "Loisbecket@gmail.com"),
        _input("Phone Number", "(212) 555-1234"),
        _password(
          "Password",
          hide: hideSignUpPassword,
          toggle: () {
            setState(() {
              hideSignUpPassword = !hideSignUpPassword;
            });
          },
        ),

        _password(
          "Confirm Password",
          hide: hideConfirmPassword,
          toggle: () {
            setState(() {
              hideConfirmPassword = !hideConfirmPassword;
            });
          },
        ),
        Row(
          children: [
            Checkbox(
              value: rememberMe,
              activeColor: Color(0xFF0A4DBF),
              side: const BorderSide(
                color: Color(0xFF0A4DBF),
                width: 2,
              ),
              onChanged: (value) {
                setState(() {
                  rememberMe = value!;
                });
              },
            ),
            Text(
              "Terms & Condition",
              style: GoogleFonts.inter(fontSize: 13,fontWeight: FontWeight.w600,color: Color(0xFF0A4DBF)),
            ),
          ],
        ),


        mainButton("Sign Up",
        () {
          Get.to(()=> OtpVerificationScreen());
        },),
      ],
    );
  }

  Widget _input(String label, String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 13,
              color: Colors.grey.shade900,
            ),
          ),
          const SizedBox(height: 6),
          TextField(style: GoogleFonts.poppins(color: Colors.black),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey.shade400),
              filled: true,
              fillColor: Colors.grey.shade50,

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.grey.shade300, // light grey
                  width: 0.8, // patla border
                ),
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.grey.shade400, // focus pe thoda visible
                  width: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget _password(String label, {required bool hide, required VoidCallback toggle}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: GoogleFonts.inter(fontSize: 13, color: Colors.grey.shade900)),
          const SizedBox(height: 6),
          TextField(
            obscureText: hide,
            style: GoogleFonts.poppins(color: Colors.black),
            decoration: InputDecoration(
              hintText: "********",
              hintStyle: TextStyle(color: Colors.grey.shade400),
              filled: true,
              fillColor: Colors.grey.shade50,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey.shade300, width: 0.8),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey.shade400, width: 1),
              ),
              suffixIcon: IconButton(
                icon: Icon(hide ? Icons.visibility : Icons.visibility_off, color: Colors.grey.shade600),
                onPressed: toggle,
              ),
            ),
          ),
        ],
      ),
    );
  }




  Widget _socialButton(String icon, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon(icon),
          Image.asset(icon),
          const SizedBox(width: 10),
          Text(text),
        ],
      ),
    );
  }
}
