import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nord/controllers/compass_controller.dart';
import 'package:provider/provider.dart';
import 'package:sprung/sprung.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CompassController _compassController =
        context.watch<CompassController>();
    final double _screenWidth = MediaQuery.of(context).size.width;
    final double _screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.topLeft,
            radius: 1.5,
            colors: [
              Color(0xFFF2F1EE),
              Color(0xFFE4E2DC),
            ],
          ),
        ),
        child: SizedBox.expand(
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Background
              Image.asset(
                'assets/images/bg.png',
                height: _screenHeight,
                width: _screenWidth,
                opacity: const AlwaysStoppedAnimation(0.5),
              ),
              // Compass Dial Background
              Image.asset(
                'assets/images/dial.png',
                height: _screenHeight,
                width: _screenWidth,
              ),
              // Compass Dial (Ticks)
              AnimatedRotation(
                duration: const Duration(milliseconds: 1000),
                curve: Sprung.criticallyDamped,
                turns: (_compassController.compassHeading ?? 0) / 360,
                child: Image.asset(
                  'assets/images/ticks.png',
                  height: _screenHeight,
                  width: _screenWidth,
                ),
              ),
              // Compass Dial (Pointer)
              Image.asset(
                'assets/images/pointer.png',
                height: _screenHeight,
                width: _screenWidth,
              ),
              // Compass Display (Text)
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 12),
                    Text(
                      '${_compassController.compassHeading?.round()}°',
                      style: GoogleFonts.redHatDisplay(
                        fontSize: 50,
                        fontWeight: FontWeight.w900,
                        color: const Color(0xFF4C4C4C),
                      ),
                    ),
                    Text(
                      '${_compassController.compassDirection}',
                      style: GoogleFonts.redHatDisplay(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xCC4C4C4C),
                      ),
                    ),
                  ],
                ),
              ),
              // Compass Display (Inner Shadow)
              Image.asset(
                'assets/images/shadow.png',
                height: _screenHeight,
                width: _screenWidth,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
