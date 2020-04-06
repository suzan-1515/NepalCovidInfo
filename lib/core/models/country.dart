import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:covid19_info/core/models/timeline_data.dart';

class Country {
  final String code;
  final String name;
  final double lat;
  final double lng;
  final int totalConfirmed;
  final int totalDeaths;
  final int totalRecovered;
  final int totalCritical;
  final int activeCases;
  final int dailyConfirmed;
  final int dailyDeaths;
  final List<TimelineData> timeline;

  Country({
    @required this.code,
    @required this.name,
    @required this.lat,
    @required this.lng,
    @required this.totalConfirmed,
    @required this.totalDeaths,
    @required this.totalRecovered,
    @required this.totalCritical,
    @required this.activeCases,
    @required this.dailyConfirmed,
    @required this.dailyDeaths,
    @required this.timeline,
  })  : assert(code != null),
        assert(name != null),
        assert(lat != null),
        assert(lng != null),
        assert(totalConfirmed != null),
        assert(totalDeaths != null),
        assert(totalRecovered != null),
        assert(totalCritical != null),
        assert(activeCases != null),
        assert(dailyConfirmed != null),
        assert(dailyDeaths != null),
        assert(timeline != null);

  bool get isValid => code != 'Error' && lat != -1.0 && lng != -1.0;

  Country copyWith({
    String code,
    String name,
    double lat,
    double lng,
    int totalConfirmed,
    int totalDeaths,
    int totalRecovered,
    int totalCritical,
    int activeCases,
    int dailyConfirmed,
    int dailyDeaths,
    List<TimelineData> timeline,
  }) {
    return Country(
      code: code ?? this.code,
      name: name ?? this.name,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      totalConfirmed: totalConfirmed ?? this.totalConfirmed,
      totalDeaths: totalDeaths ?? this.totalDeaths,
      totalRecovered: totalRecovered ?? this.totalRecovered,
      totalCritical: totalCritical ?? this.totalCritical,
      activeCases: activeCases ?? this.activeCases,
      dailyConfirmed: dailyConfirmed ?? this.dailyConfirmed,
      dailyDeaths: dailyDeaths ?? this.dailyDeaths,
      timeline: timeline ?? this.timeline,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'countryCode': code,
      'country': name,
      'lat': lat,
      'lng': lng,
      'totalConfirmed': totalConfirmed,
      'totalDeaths': totalDeaths,
      'totalRecovered': totalRecovered,
      'totalCritical': totalCritical,
      'activeCases': activeCases,
      'dailyConfirmed': dailyConfirmed,
      'dailyDeaths': dailyDeaths,
      'timeline': List<dynamic>.from(timeline.map((x) => x.toMap())),
    };
  }

  static Country fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Country(
      code: map['countryCode'] ?? 'Error',
      name: map['country'],
      lat: map['lat'] == null ? -1.0 : (map['lat'] as num).toDouble(),
      lng: map['lng'] == null ? -1.0 : (map['lng'] as num).toDouble(),
      totalConfirmed: map['totalConfirmed'],
      totalDeaths: map['totalDeaths'],
      totalRecovered: map['totalRecovered'],
      totalCritical: map['totalCritical'],
      activeCases: map['activeCases'],
      dailyConfirmed: map['dailyConfirmed'],
      dailyDeaths: map['dailyDeaths'],
      timeline: map.containsKey('timeline')
          ? List<TimelineData>.from(map['timeline']?.map((x) => TimelineData.fromMap(x)))
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  static Country fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Country(code: $code, name: $name, lat: $lat, lng: $lng, totalConfirmed: $totalConfirmed, totalDeaths: $totalDeaths, totalRecovered: $totalRecovered, totalCritical: $totalCritical, activeCases: $activeCases, dailyConfirmed: $dailyConfirmed, dailyDeaths: $dailyDeaths, timeline: $timeline)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Country &&
        o.code == code &&
        o.name == name &&
        o.lat == lat &&
        o.lng == lng &&
        o.totalConfirmed == totalConfirmed &&
        o.totalDeaths == totalDeaths &&
        o.totalRecovered == totalRecovered &&
        o.totalCritical == totalCritical &&
        o.activeCases == activeCases &&
        o.dailyConfirmed == dailyConfirmed &&
        o.dailyDeaths == dailyDeaths &&
        listEquals(o.timeline, timeline);
  }

  @override
  int get hashCode {
    return code.hashCode ^
        name.hashCode ^
        lat.hashCode ^
        lng.hashCode ^
        totalConfirmed.hashCode ^
        totalDeaths.hashCode ^
        totalRecovered.hashCode ^
        totalCritical.hashCode ^
        activeCases.hashCode ^
        dailyConfirmed.hashCode ^
        dailyDeaths.hashCode ^
        timeline.hashCode;
  }
}
