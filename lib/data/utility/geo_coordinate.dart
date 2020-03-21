/// Data struct that represents a point on the earth surface
class GeoCoordinate{
  final String latitude;
  final String longitude;

  /// Creates a new GeoCoordinate
  ///
  /// Specify
  ///  - the latitude
  ///  - the longitude
  GeoCoordinate(this.latitude, this.longitude);

  @override
  String toString() {
    return latitude + ' lat / ' + longitude + ' lon';
  }
}