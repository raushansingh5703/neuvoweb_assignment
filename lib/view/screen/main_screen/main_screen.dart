import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neuvoweb_assignment/view/screen/home_screen/home_screen.dart';
import 'package:neuvoweb_assignment/view/screen/home_screen/post_screen.dart';
import 'package:neuvoweb_assignment/view/screen/home_screen/service_screen.dart';

import '../../../core/widgets/bottom_navbar_widgets.dart';



class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    HomeScreen(),
    EmptyScreen(),
    PostJobScreen(),
    ServicesScreen(),
    EmptyScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: selectedIndex,
        onItemSelected: (index) {
          if (index == selectedIndex) return;
          setState(() => selectedIndex = index);
        },
      ),
    );
  }
}

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "No Screen Available",
        style: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.grey,
        ),
      ),
    );
  }
}


