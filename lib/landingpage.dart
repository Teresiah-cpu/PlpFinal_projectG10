import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Girl logo
              Padding(
                padding: const EdgeInsets.only(
                  left: 30.0,
                  right: 20.0,
                  top: 70,
                  bottom: 20,
                ),
                child: Image.asset('images/girl3.png'),
              ),

              // Main title
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: Text(
                  'SHE ADVOCATE',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.notoSerif(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF6A1B9A), // Purple color
                  ),
                ),
              ),

              // Sub-title
              Text(
                'Together We Empower her',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),

              const SizedBox(height: 24),

              const SizedBox(height: 50), // space before the button

              // Get started button
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginPage();
                    },
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color(0xFF6A1B9A), // Purple color
                  ),
                  child: const Text(
                    "Get Started",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 50), // space after the button
            ],
          ),
        ),
      ),
    );
  }
}
