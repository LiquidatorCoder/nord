import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:nord/services/compass_service.dart';

class CompassController with ChangeNotifier {
  final CompassService _compassService = CompassService();
  StreamSubscription<double?>? _compassHeadingSubscription;
  StreamSubscription<String>? _compassDirectionSubscription;
  double? compassHeading;
  String? compassDirection;

  CompassController() {
    _compassHeadingSubscription =
        _compassService.compassHeadingStream?.listen((event) {
      compassHeading = event;
      notifyListeners();
    });
    _compassDirectionSubscription =
        _compassService.compassDirectionStream?.listen((event) {
      compassDirection = event;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _compassHeadingSubscription?.cancel();
    _compassDirectionSubscription?.cancel();
    super.dispose();
  }
}
