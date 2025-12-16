import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: 480,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff154ca0), Color(0xff154ca0)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.vertical(
                // bottom: Radius.circular(35),
              ),
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _appBarContent(),
                  const SizedBox(height: 15),
                  _serviceBanner(),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 25),
                        _serviceSection(),
                        const SizedBox(height: 20),
                        _categorySection(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _appBarContent() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage("assets/profile/profile_photo.jpg"),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello Tristan!",
                    style: GoogleFonts.inter(color: Colors.white, fontSize: 14),
                  ),
                  Text(
                    "Airport Gate - Motital Colony",
                    style: GoogleFonts.inter(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              const Icon(Icons.notifications, color: Colors.white),
              const SizedBox(width: 15),
              const Icon(Icons.shopping_cart, color: Colors.white),
            ],
          ),

          const SizedBox(height: 15),

          Container(
            height: 45,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              children: [
                const Icon(Icons.search, color: Colors.grey),
                const SizedBox(width: 10),
                Text(
                  "Search for 'Asphalt Repair'",
                  style: GoogleFonts.inter(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _serviceBanner() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Color(0xff154ca0),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Image.asset(
        "assets/images/img.png",
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }



  Widget _serviceSection() {
    final services = [
      {"title": "Paving", "image": "assets/service/1.jpg"},
      {"title": "Sealcoating", "image": "assets/service/2.jpg"},
      {"title": "Cold Planing", "image": "assets/service/3.jpg"},
      {"title": "Asphalt Repair", "image": "assets/service/4.jpg"},
      {"title": "Sports Court", "image": "assets/service/5.jpg"},
      {"title": "Crack Seal", "image": "assets/service/6.jpg"},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          /// TITLE
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Service",
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "View All",
                style: GoogleFonts.inter(
                  color: const Color(0xff154ca0),
                  fontSize: 13,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: services.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1, // square like figma
            ),
            itemBuilder: (_, i) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        services[i]["image"]!,
                        fit: BoxFit.cover,
                      ),
                    ),

                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.6),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 50,
                      left: 4,
                      right: 4,
                      child: Center(
                        child: Text(
                          services[i]["title"]!,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _categorySection() {
    final categories = [
      {
        "name": "Lucy",
        "image": "assets/categories/1.jpg",
        "rating": 3,
        "phone": "+732 8888 111",
      },
      {
        "name": "Laila",
        "image": "assets/categories/2.jpg",
        "rating": 2,
        "phone": "+732 8888 111",
      },
      {
        "name": "Doe John",
        "image": "assets/categories/3.jpg",
        "rating": 3,
        "phone": "+732 8888 111",
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Categories",
            style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),

          SizedBox(
            height: 230,
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 10),
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, i) {
                final item = categories[i];
                final int rating = (item["rating"] ?? 0) as int;
                return Container(
                  width: 160,
                  margin: const EdgeInsets.only(right: 14),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          item["image"].toString(),
                          height: 120,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),

                      const SizedBox(height: 8),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            item["name"].toString(),
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Row(
                            children: List.generate(
                              3,
                                  (index) => Icon(
                                Icons.star,
                                size: 14,
                                color: index < rating
                                    ? Colors.red
                                    : Colors.grey.shade300,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 4),



                      const SizedBox(height: 6),

                      Row(
                        children: [
                          const Icon(
                            Icons.phone_android,
                            size: 14,
                            color: Colors.black54,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            item["phone"].toString(),
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

}
