class WeatherDataCurrent {
  final Current current;
  WeatherDataCurrent({required this.current});

  factory WeatherDataCurrent.fromJson(Map<String, dynamic> json) {
    return WeatherDataCurrent(current: Current.fromJson(json));
  }
}

class Current {
  // Requerimentos Especificados

  double? tempC;
  Condition? condition;
  double? windKph;
  double? humidity;

  Current({this.tempC, this.condition, this.windKph, this.humidity});

  factory Current.fromJson(Map<String, dynamic> json) => Current(
    tempC: json["temp_c"]?.toDouble(),
    windKph: json["wind_kph"]?.toDouble(),
    humidity: json["humidity"]?.toDouble(),
    condition: json["condition"] != null
            ? Condition.fromJson(json["condition"])
            : null
  );
}

class Condition {
  String? text;
  String? icon;
  int? code;

  Condition({this.text, this.icon, this.code});

  factory Condition.fromJson(Map<String, dynamic> json) =>
      Condition(text: json["text"], icon: json["icon"], code: json["code"]);
}
