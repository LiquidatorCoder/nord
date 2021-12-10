import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:nord/services/compass_service.dart';

class CompassController with ChangeNotifier {
  final CompassService _compassService = CompassService();
  // StreamSubscription<double?>? _compassHeadingSubscription;
  // StreamSubscription<String>? _compassDirectionSubscription;
  StreamSubscription<CompassEvent>? _compassSubscription;
  double? compassHeading;
  String? compassDirection;

  CompassController() {
    // _compassDirectionSubscription =
    //     _compassService.compassDirectionStream?.listen((event) {
    //   compassDirection = event;
    //   notifyListeners();
    // });
    // _compassHeadingSubscription =
    //     _compassService.compassHeadingStream?.listen((event) {
    //   compassHeading = event;
    //   notifyListeners();
    // });
    _compassSubscription = _compassService.compassStream?.listen((event) {
      compassHeading = event.heading;
      compassDirection = _compassService.getDirection(event.heading ?? 0);
      notifyListeners();
    });
  }

  @override
  void dispose() {
    // _compassHeadingSubscription?.cancel();
    // _compassDirectionSubscription?.cancel();
    _compassSubscription?.cancel();
    super.dispose();
  }
}
