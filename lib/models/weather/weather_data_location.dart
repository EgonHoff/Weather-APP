class LocationCurrent {
  final Location location;
  LocationCurrent({required this.location});

  factory LocationCurrent.fromJson(Map<String, dynamic> json) {
    return LocationCurrent(location: Location.fromJson(json));
  }
}


class Location {
  String? name;
  String? region;
  String? country;
  double? lat;
  double? lon;
  String? tzId;
  String? localtime;

  Location({
    this.name,
    this.region,
    this.country,
    this.lat,
    this.lon,
    this.tzId,
    this.localtime,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      name: json['name'],
      region: json['region'],
      country: json['country'],
      lat: json['lat']?.toDouble(),
      lon: json['lon']?.toDouble(),
      tzId: json['tz_id'],
      localtime: json['localtime'],
    );
  }
}
