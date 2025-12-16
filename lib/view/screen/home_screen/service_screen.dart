import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/widgets/service_card_widgets.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 32),
                    const Icon(Icons.arrow_back_ios,
                        color: Color(0xFF1E5DD3)),
                    Expanded(
                      child: Center(
                        child: Text(
                          "Looking for Services",
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 32),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  ServiceCustomCard(
                    title: "General Contracting",
                    image:
                    "https://images.unsplash.com/photo-1581090700227-1e37b190418e",
                  ),
                  ServiceCustomCard(
                    title: "Kitchen remodel",
                    image:
                    "https://images.unsplash.com/photo-1556912173-3bb406ef7e77",
                  ),
                  ServiceCustomCard(
                    title: "Bathroom remodel",
                    image:
                    "https://images.unsplash.com/photo-1600566753086-00f18fb6b3ea",
                  ),
                  ServiceCustomCard(
                    title: "Home additions",
                    image:
                    "https://images.unsplash.com/photo-1568605114967-8130f3a36994",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


