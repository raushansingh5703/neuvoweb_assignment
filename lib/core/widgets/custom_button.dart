import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neuvoweb_assignment/utils/app_colors.dart';

Widget mainButton(String text,void Function()? onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: AppColors.primaryBlueGradient
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: GoogleFonts.inter(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}