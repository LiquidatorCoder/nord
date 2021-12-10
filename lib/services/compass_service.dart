import 'package:flutter_compass/flutter_compass.dart';

class CompassService {
  // method to get the current heading direction
  String getDirection(double heading) {
    if (heading >= 0 && heading < 22.5) {
      return 'N';
    } else if (heading >= 22.5 && heading < 67.5) {
      return 'NE';
    } else if (heading >= 67.5 && heading < 112.5) {
      return 'E';
    } else if (heading >= 112.5 && heading < 157.5) {
      return 'SE';
    } else if (heading >= 157.5 && heading < 202.5) {
      return 'S';
    } else if (heading >= 202.5 && heading < 247.5) {
      return 'SW';
    } else if (heading >= 247.5 && heading < 292.5) {
      return 'W';
    } else if (heading >= 292.5 && heading < 337.5) {
      return 'NW';
    } else if (heading >= 337.5 && heading < 360) {
      return 'N';
    } else {
      return 'N';
    }
  }

  // Getter to get current heading data stream
  Stream<double?>? get compassHeadingStream {
    return FlutterCompass.events?.map((event) => event.heading);
  }

  // Getter to get current heading direction stream
  Stream<String>? get compassDirectionStream {
    return FlutterCompass.events
        ?.map((event) => getDirection(event.heading ?? 0));
  }

  // Getter to get current compass data stream
  Stream<CompassEvent>? get compassStream {
    return FlutterCompass.events;
  }
}
