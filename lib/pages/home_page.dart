import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:nord/controllers/compass_controller.dart';
import 'package:provider/provider.dart';

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
            children: [
              Image.asset(
                'assets/images/bg.png',
                height: _screenHeight,
                width: _screenWidth,
                opacity: const AlwaysStoppedAnimation(0.5),
              ),
              Center(
                child: Image.asset(
                  'assets/images/dial.png',
                  height: _screenHeight,
                  width: _screenWidth,
                ),
              ),
              Center(
                child: AnimatedRotation(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.bounceIn,
                  turns:
                      (_compassController.compassHeading?.round() ?? 0) / 360,
                  child: Image.asset(
                    'assets/images/ticks.png',
                    height: _screenHeight,
                    width: _screenWidth,
                  ),
                ),
              ),
              Center(
                child: Image.asset(
                  'assets/images/pointer.png',
                  height: _screenHeight,
                  width: _screenWidth,
                ),
              ),
              Center(
                child: Text(
                  '${_compassController.compassHeading?.round()}° ${_compassController.compassDirection}',
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4C4C4C),
                  ),
                ),
              ),
              Center(
                child: Image.asset(
                  'assets/images/shadow.png',
                  height: _screenHeight,
                  width: _screenWidth,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
