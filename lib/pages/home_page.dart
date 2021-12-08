import 'package:flutter/material.dart';
import 'package:nord/controllers/compass_controller.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CompassController _compassController =
        context.watch<CompassController>();
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
          child: Center(
            child: Text(
              '${_compassController.compassHeading} ${_compassController.compassDirection}',
            ),
          ),
        ),
      ),
    );
  }
}
