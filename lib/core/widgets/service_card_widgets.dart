import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neuvoweb_assignment/utils/app_colors.dart';
class ServiceCustomCard extends StatelessWidget {
  final String title;
  final String image;

  const ServiceCustomCard({
    super.key,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF4A001F),
                  ),
                ),
                const SizedBox(height: 8),

                Row(
                  children: [
                    const Icon(Icons.star,
                        size: 18, color: Color(0xFFF4C430)),
                    const SizedBox(width: 6),
                    Text(
                      "2000",
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF9B4A64),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                Container(
                  height: 36,
                  width: 90,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: AppColors.primaryBlueGradient,
                    // color: const Color(0xFF2F5FD1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Buy",
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 14),

          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: CachedNetworkImage(
              width: 140,
              height: 140,fit: BoxFit.cover,
              imageUrl: image,
              placeholder: (context, url) => CircularProgressIndicator(strokeWidth: 1,),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
        ],
      ),
    );
  }
}
