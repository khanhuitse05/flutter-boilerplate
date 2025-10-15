import 'dart:math';

class MapUtils {
  static double? getDistanceFromLatLonInKm(
      double? lat1, double? lng1, double? lat2, double? lng2) {
    if (lat1 == null || lng1 == null || lat2 == null || lng2 == null) {
      return null;
    }
    double deg2rad(double deg) => deg * (pi / 180);
    const R = 6371; // Radius of the earth in km
    final double dLat = (lat2 - lat1) * (pi / 180);

    final double dLng = deg2rad(lng2 - lng1);
    final double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(deg2rad(lat1)) * cos(deg2rad(lat2)) * sin(dLng / 2) * sin(dLng / 2);
    final double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    final double d = R * c; // Distance in km
    // xLog.i('getDistanceFromLatLonInKm: $d');
    return d;
  }

  /// distanceFilter: default 10 meter
  static bool? checkDistanceFilter(
      double? lat1, double? lng1, double? lat2, double? lng2,
      {double distanceFilter = 10}) {
    if (lat1 == null || lng1 == null || lat2 == null || lng2 == null) {
      return null;
    }
    final distance = getDistanceFromLatLonInKm(lat1, lng1, lat2, lng2);
    if (distance != null) {
      final distanceMeter = distance * 1000;
      return distanceMeter >= distanceFilter;
    }
    return true;
  }
}
