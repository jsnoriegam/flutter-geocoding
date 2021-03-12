import 'package:meta/meta.dart';

/// Contains detailed placemark information.
@immutable
class Placemark {
  /// Constructs an instance with the given values for testing. [Placemark]
  /// instances constructed this way won't actually reflect any real information
  /// from the platform, just whatever was passed in at construction time.
  Placemark({
    this.name,
    this.street,
    this.isoCountryCode,
    this.country,
    this.postalCode,
    this.administrativeArea,
    this.subAdministrativeArea,
    this.locality,
    this.subLocality,
    this.thoroughfare,
    this.subThoroughfare,
    this.latitude,
    this.longitude,
    this.timestamp,
  });

  Placemark._({
    this.name,
    this.street,
    this.isoCountryCode,
    this.country,
    this.postalCode,
    this.administrativeArea,
    this.subAdministrativeArea,
    this.locality,
    this.subLocality,
    this.thoroughfare,
    this.subThoroughfare,
    this.latitude,
    this.longitude,
    this.timestamp,
  });

  /// The name associated with the placemark.
  final String name;

  /// The street associated with the placemark.
  final String street;

  /// The abbreviated country name, according to the two letter (alpha-2) [ISO standard](https://www.iso.org/iso-3166-country-codes.html).
  final String isoCountryCode;

  /// The name of the country associated with the placemark.
  final String country;

  /// The postal code associated with the placemark.
  final String postalCode;

  /// The name of the state or province associated with the placemark.
  final String administrativeArea;

  /// Additional administrative area information for the placemark.
  final String subAdministrativeArea;

  /// The name of the city associated with the placemark.
  final String locality;

  /// Additional city-level information for the placemark.
  final String subLocality;

  /// The street address associated with the placemark.
  final String thoroughfare;

  /// Additional street address information for the placemark.
  final String subThoroughfare;

  /// The latitude associated with the placemark.
  final double latitude;

  /// The longitude associated with the placemark.
  final double longitude;

  /// The UTC timestamp the coordinates have been requested.
  final DateTime timestamp;

  @override
  bool operator ==(dynamic o) =>
      o is Placemark &&
      o.administrativeArea == administrativeArea &&
      o.country == country &&
      o.isoCountryCode == isoCountryCode &&
      o.locality == locality &&
      o.name == name &&
      o.postalCode == postalCode &&
      o.street == street &&
      o.subAdministrativeArea == subAdministrativeArea &&
      o.subLocality == subLocality &&
      o.subThoroughfare == subThoroughfare &&
      o.thoroughfare == thoroughfare &&
      o.latitude == latitude &&
      o.longitude == longitude &&
      o.timestamp == timestamp;

  @override
  int get hashCode =>
      administrativeArea.hashCode ^
      country.hashCode ^
      isoCountryCode.hashCode ^
      locality.hashCode ^
      name.hashCode ^
      postalCode.hashCode ^
      street.hashCode ^
      subAdministrativeArea.hashCode ^
      subLocality.hashCode ^
      subThoroughfare.hashCode ^
      thoroughfare.hashCode ^
      latitude.hashCode ^
      longitude.hashCode ^
      timestamp.hashCode;

  /// Converts a list of [Map] instances to a list of [Placemark] instances.
  static List<Placemark> fromMaps(dynamic message) {
    if (message == null) {
      throw ArgumentError('The parameter \'message\' should not be null.');
    }

    final List<Placemark> list = message.map<Placemark>(fromMap).toList();
    return list;
  }

  /// Converts the supplied [Map] to an instance of the [Placemark] class.
  static Placemark fromMap(dynamic message) {
    if (message == null) {
      throw ArgumentError('The parameter \'message\' should not be null.');
    }

    final Map<dynamic, dynamic> placemarkMap = message;

    final timestamp = placemarkMap['timestamp'] != null
        ? DateTime.fromMillisecondsSinceEpoch(placemarkMap['timestamp'].toInt(),
            isUtc: true)
        : null;

    return Placemark._(
      name: placemarkMap['name'] ?? '',
      street: placemarkMap['street'] ?? '',
      isoCountryCode: placemarkMap['isoCountryCode'] ?? '',
      country: placemarkMap['country'] ?? '',
      postalCode: placemarkMap['postalCode'] ?? '',
      administrativeArea: placemarkMap['administrativeArea'] ?? '',
      subAdministrativeArea: placemarkMap['subAdministrativeArea'] ?? '',
      locality: placemarkMap['locality'] ?? '',
      subLocality: placemarkMap['subLocality'] ?? '',
      thoroughfare: placemarkMap['thoroughfare'] ?? '',
      subThoroughfare: placemarkMap['subThoroughfare'] ?? '',
      latitude: placemarkMap['latitude'] ?? null,
      longitude: placemarkMap['longitude'] ?? null,
      timestamp: timestamp,
    );
  }

  /// Converts the [Placemark] instance into a [Map] instance that can be
  /// serialized to JSON.
  Map<String, dynamic> toJson() => {
        'name': name,
        'street': street,
        'isoCountryCode': isoCountryCode,
        'country': country,
        'postalCode': postalCode,
        'administrativeArea': administrativeArea,
        'subAdministrativeArea': subAdministrativeArea,
        'locality': locality,
        'subLocality': subLocality,
        'thoroughfare': thoroughfare,
        'subThoroughfare': subThoroughfare,
        'latitude': latitude,
        'longitude': longitude,
        'timestamp': timestamp?.millisecondsSinceEpoch ?? null,
      };

  @override
  String toString() {
    return '''
      Name: $name, 
      Street: $street, 
      ISO Country Code: $isoCountryCode, 
      Country: $country, 
      Postal code: $postalCode, 
      Administrative area: $administrativeArea, 
      Subadministrative area: $subAdministrativeArea,
      Locality: $locality,
      Sublocality: $subLocality,
      Thoroughfare: $thoroughfare,
      Subthoroughfare: $subThoroughfare,
      Latitude: $latitude,
      Longitude: $longitude,
      Timestamp: $timestamp''';
  }
}
