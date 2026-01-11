import 'package:json_annotation/json_annotation.dart';

part 'prayer_times_response.g.dart';

@JsonSerializable()
class PrayerTimesResponse {
  final int code;
  final String status;
  final PrayerTimesData data;

  PrayerTimesResponse({
    required this.code,
    required this.status,
    required this.data,
  });

  factory PrayerTimesResponse.fromJson(Map<String, dynamic> json) =>
      _$PrayerTimesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PrayerTimesResponseToJson(this);
}

@JsonSerializable()
class PrayerTimesData {
  final Timings timings;
  final DateInfo date;
  final Meta meta;

  PrayerTimesData({
    required this.timings,
    required this.date,
    required this.meta,
  });

  factory PrayerTimesData.fromJson(Map<String, dynamic> json) =>
      _$PrayerTimesDataFromJson(json);

  Map<String, dynamic> toJson() => _$PrayerTimesDataToJson(this);
}

@JsonSerializable()
class Timings {
  @JsonKey(name: 'Fajr')
  final String fajr;
  @JsonKey(name: 'Sunrise')
  final String sunrise;
  @JsonKey(name: 'Dhuhr')
  final String dhuhr;
  @JsonKey(name: 'Asr')
  final String asr;
  @JsonKey(name: 'Sunset')
  final String sunset;
  @JsonKey(name: 'Maghrib')
  final String maghrib;
  @JsonKey(name: 'Isha')
  final String isha;
  @JsonKey(name: 'Imsak')
  final String imsak;
  @JsonKey(name: 'Midnight')
  final String midnight;
  @JsonKey(name: 'Firstthird')
  final String firstthird;
  @JsonKey(name: 'Lastthird')
  final String lastthird;

  Timings({
    required this.fajr,
    required this.sunrise,
    required this.dhuhr,
    required this.asr,
    required this.sunset,
    required this.maghrib,
    required this.isha,
    required this.imsak,
    required this.midnight,
    required this.firstthird,
    required this.lastthird,
  });

  factory Timings.fromJson(Map<String, dynamic> json) =>
      _$TimingsFromJson(json);

  Map<String, dynamic> toJson() => _$TimingsToJson(this);
}

@JsonSerializable()
class DateInfo {
  final String readable;
  final String timestamp;
  final HijriDate hijri;
  final GregorianDate gregorian;

  DateInfo({
    required this.readable,
    required this.timestamp,
    required this.hijri,
    required this.gregorian,
  });

  factory DateInfo.fromJson(Map<String, dynamic> json) =>
      _$DateInfoFromJson(json);

  Map<String, dynamic> toJson() => _$DateInfoToJson(this);
}

@JsonSerializable()
class HijriDate {
  final String date;
  final String format;
  final String day;
  final Weekday weekday;
  final HijriMonth month;
  final String year;
  final Designation designation;
  final List<dynamic> holidays;
  final List<dynamic> adjustedHolidays;
  final String method;

  HijriDate({
    required this.date,
    required this.format,
    required this.day,
    required this.weekday,
    required this.month,
    required this.year,
    required this.designation,
    required this.holidays,
    required this.adjustedHolidays,
    required this.method,
  });

  factory HijriDate.fromJson(Map<String, dynamic> json) =>
      _$HijriDateFromJson(json);

  Map<String, dynamic> toJson() => _$HijriDateToJson(this);
}

@JsonSerializable()
class Weekday {
  final String en;
  final String? ar;

  Weekday({
    required this.en,
    this.ar,
  });

  factory Weekday.fromJson(Map<String, dynamic> json) =>
      _$WeekdayFromJson(json);

  Map<String, dynamic> toJson() => _$WeekdayToJson(this);
}

@JsonSerializable()
class HijriMonth {
  final int number;
  final String en;
  final String ar;
  final int days;

  HijriMonth({
    required this.number,
    required this.en,
    required this.ar,
    required this.days,
  });

  factory HijriMonth.fromJson(Map<String, dynamic> json) =>
      _$HijriMonthFromJson(json);

  Map<String, dynamic> toJson() => _$HijriMonthToJson(this);
}

@JsonSerializable()
class Designation {
  final String abbreviated;
  final String expanded;

  Designation({
    required this.abbreviated,
    required this.expanded,
  });

  factory Designation.fromJson(Map<String, dynamic> json) =>
      _$DesignationFromJson(json);

  Map<String, dynamic> toJson() => _$DesignationToJson(this);
}

@JsonSerializable()
class GregorianDate {
  final String date;
  final String format;
  final String day;
  final Weekday weekday;
  final GregorianMonth month;
  final String year;
  final Designation designation;
  final bool lunarSighting;

  GregorianDate({
    required this.date,
    required this.format,
    required this.day,
    required this.weekday,
    required this.month,
    required this.year,
    required this.designation,
    required this.lunarSighting,
  });

  factory GregorianDate.fromJson(Map<String, dynamic> json) =>
      _$GregorianDateFromJson(json);

  Map<String, dynamic> toJson() => _$GregorianDateToJson(this);
}

@JsonSerializable()
class GregorianMonth {
  final int number;
  final String en;

  GregorianMonth({
    required this.number,
    required this.en,
  });

  factory GregorianMonth.fromJson(Map<String, dynamic> json) =>
      _$GregorianMonthFromJson(json);

  Map<String, dynamic> toJson() => _$GregorianMonthToJson(this);
}

@JsonSerializable()
class Meta {
  final double latitude;
  final double longitude;
  final String timezone;
  final Method method;
  final String latitudeAdjustmentMethod;
  final String midnightMode;
  final String school;
  final Offset offset;

  Meta({
    required this.latitude,
    required this.longitude,
    required this.timezone,
    required this.method,
    required this.latitudeAdjustmentMethod,
    required this.midnightMode,
    required this.school,
    required this.offset,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);
}

@JsonSerializable()
class Method {
  final int id;
  final String name;
  final MethodParams params;
  final Location location;

  Method({
    required this.id,
    required this.name,
    required this.params,
    required this.location,
  });

  factory Method.fromJson(Map<String, dynamic> json) =>
      _$MethodFromJson(json);

  Map<String, dynamic> toJson() => _$MethodToJson(this);
}

@JsonSerializable()
class MethodParams {
  @JsonKey(name: 'Fajr')
  final double fajr;
  @JsonKey(name: 'Isha')
  final double isha;

  MethodParams({
    required this.fajr,
    required this.isha,
  });

  factory MethodParams.fromJson(Map<String, dynamic> json) =>
      _$MethodParamsFromJson(json);

  Map<String, dynamic> toJson() => _$MethodParamsToJson(this);
}

@JsonSerializable()
class Location {
  final double latitude;
  final double longitude;

  Location({
    required this.latitude,
    required this.longitude,
  });

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

@JsonSerializable()
class Offset {
  @JsonKey(name: 'Imsak')
  final int imsak;
  @JsonKey(name: 'Fajr')
  final int fajr;
  @JsonKey(name: 'Sunrise')
  final int sunrise;
  @JsonKey(name: 'Dhuhr')
  final int dhuhr;
  @JsonKey(name: 'Asr')
  final int asr;
  @JsonKey(name: 'Maghrib')
  final int maghrib;
  @JsonKey(name: 'Sunset')
  final int sunset;
  @JsonKey(name: 'Isha')
  final int isha;
  @JsonKey(name: 'Midnight')
  final int midnight;

  Offset({
    required this.imsak,
    required this.fajr,
    required this.sunrise,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.sunset,
    required this.isha,
    required this.midnight,
  });

  factory Offset.fromJson(Map<String, dynamic> json) =>
      _$OffsetFromJson(json);

  Map<String, dynamic> toJson() => _$OffsetToJson(this);
}