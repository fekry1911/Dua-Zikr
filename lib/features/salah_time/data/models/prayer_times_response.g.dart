// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prayer_times_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrayerTimesResponse _$PrayerTimesResponseFromJson(Map<String, dynamic> json) =>
    PrayerTimesResponse(
      code: (json['code'] as num).toInt(),
      status: json['status'] as String,
      data: PrayerTimesData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PrayerTimesResponseToJson(
  PrayerTimesResponse instance,
) => <String, dynamic>{
  'code': instance.code,
  'status': instance.status,
  'data': instance.data,
};

PrayerTimesData _$PrayerTimesDataFromJson(Map<String, dynamic> json) =>
    PrayerTimesData(
      timings: Timings.fromJson(json['timings'] as Map<String, dynamic>),
      date: DateInfo.fromJson(json['date'] as Map<String, dynamic>),
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PrayerTimesDataToJson(PrayerTimesData instance) =>
    <String, dynamic>{
      'timings': instance.timings,
      'date': instance.date,
      'meta': instance.meta,
    };

Timings _$TimingsFromJson(Map<String, dynamic> json) => Timings(
  fajr: json['Fajr'] as String,
  sunrise: json['Sunrise'] as String,
  dhuhr: json['Dhuhr'] as String,
  asr: json['Asr'] as String,
  sunset: json['Sunset'] as String,
  maghrib: json['Maghrib'] as String,
  isha: json['Isha'] as String,
  imsak: json['Imsak'] as String,
  midnight: json['Midnight'] as String,
  firstthird: json['Firstthird'] as String,
  lastthird: json['Lastthird'] as String,
);

Map<String, dynamic> _$TimingsToJson(Timings instance) => <String, dynamic>{
  'Fajr': instance.fajr,
  'Sunrise': instance.sunrise,
  'Dhuhr': instance.dhuhr,
  'Asr': instance.asr,
  'Sunset': instance.sunset,
  'Maghrib': instance.maghrib,
  'Isha': instance.isha,
  'Imsak': instance.imsak,
  'Midnight': instance.midnight,
  'Firstthird': instance.firstthird,
  'Lastthird': instance.lastthird,
};

DateInfo _$DateInfoFromJson(Map<String, dynamic> json) => DateInfo(
  readable: json['readable'] as String,
  timestamp: json['timestamp'] as String,
  hijri: HijriDate.fromJson(json['hijri'] as Map<String, dynamic>),
  gregorian: GregorianDate.fromJson(json['gregorian'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DateInfoToJson(DateInfo instance) => <String, dynamic>{
  'readable': instance.readable,
  'timestamp': instance.timestamp,
  'hijri': instance.hijri,
  'gregorian': instance.gregorian,
};

HijriDate _$HijriDateFromJson(Map<String, dynamic> json) => HijriDate(
  date: json['date'] as String,
  format: json['format'] as String,
  day: json['day'] as String,
  weekday: Weekday.fromJson(json['weekday'] as Map<String, dynamic>),
  month: HijriMonth.fromJson(json['month'] as Map<String, dynamic>),
  year: json['year'] as String,
  designation: Designation.fromJson(
    json['designation'] as Map<String, dynamic>,
  ),
  holidays: json['holidays'] as List<dynamic>,
  adjustedHolidays: json['adjustedHolidays'] as List<dynamic>,
  method: json['method'] as String,
);

Map<String, dynamic> _$HijriDateToJson(HijriDate instance) => <String, dynamic>{
  'date': instance.date,
  'format': instance.format,
  'day': instance.day,
  'weekday': instance.weekday,
  'month': instance.month,
  'year': instance.year,
  'designation': instance.designation,
  'holidays': instance.holidays,
  'adjustedHolidays': instance.adjustedHolidays,
  'method': instance.method,
};

Weekday _$WeekdayFromJson(Map<String, dynamic> json) =>
    Weekday(en: json['en'] as String, ar: json['ar'] as String?);

Map<String, dynamic> _$WeekdayToJson(Weekday instance) => <String, dynamic>{
  'en': instance.en,
  'ar': instance.ar,
};

HijriMonth _$HijriMonthFromJson(Map<String, dynamic> json) => HijriMonth(
  number: (json['number'] as num).toInt(),
  en: json['en'] as String,
  ar: json['ar'] as String,
  days: (json['days'] as num).toInt(),
);

Map<String, dynamic> _$HijriMonthToJson(HijriMonth instance) =>
    <String, dynamic>{
      'number': instance.number,
      'en': instance.en,
      'ar': instance.ar,
      'days': instance.days,
    };

Designation _$DesignationFromJson(Map<String, dynamic> json) => Designation(
  abbreviated: json['abbreviated'] as String,
  expanded: json['expanded'] as String,
);

Map<String, dynamic> _$DesignationToJson(Designation instance) =>
    <String, dynamic>{
      'abbreviated': instance.abbreviated,
      'expanded': instance.expanded,
    };

GregorianDate _$GregorianDateFromJson(Map<String, dynamic> json) =>
    GregorianDate(
      date: json['date'] as String,
      format: json['format'] as String,
      day: json['day'] as String,
      weekday: Weekday.fromJson(json['weekday'] as Map<String, dynamic>),
      month: GregorianMonth.fromJson(json['month'] as Map<String, dynamic>),
      year: json['year'] as String,
      designation: Designation.fromJson(
        json['designation'] as Map<String, dynamic>,
      ),
      lunarSighting: json['lunarSighting'] as bool,
    );

Map<String, dynamic> _$GregorianDateToJson(GregorianDate instance) =>
    <String, dynamic>{
      'date': instance.date,
      'format': instance.format,
      'day': instance.day,
      'weekday': instance.weekday,
      'month': instance.month,
      'year': instance.year,
      'designation': instance.designation,
      'lunarSighting': instance.lunarSighting,
    };

GregorianMonth _$GregorianMonthFromJson(Map<String, dynamic> json) =>
    GregorianMonth(
      number: (json['number'] as num).toInt(),
      en: json['en'] as String,
    );

Map<String, dynamic> _$GregorianMonthToJson(GregorianMonth instance) =>
    <String, dynamic>{'number': instance.number, 'en': instance.en};

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
  timezone: json['timezone'] as String,
  method: Method.fromJson(json['method'] as Map<String, dynamic>),
  latitudeAdjustmentMethod: json['latitudeAdjustmentMethod'] as String,
  midnightMode: json['midnightMode'] as String,
  school: json['school'] as String,
  offset: Offset.fromJson(json['offset'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'timezone': instance.timezone,
  'method': instance.method,
  'latitudeAdjustmentMethod': instance.latitudeAdjustmentMethod,
  'midnightMode': instance.midnightMode,
  'school': instance.school,
  'offset': instance.offset,
};

Method _$MethodFromJson(Map<String, dynamic> json) => Method(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  params: MethodParams.fromJson(json['params'] as Map<String, dynamic>),
  location: Location.fromJson(json['location'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MethodToJson(Method instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'params': instance.params,
  'location': instance.location,
};

MethodParams _$MethodParamsFromJson(Map<String, dynamic> json) => MethodParams(
  fajr: (json['Fajr'] as num).toDouble(),
  isha: (json['Isha'] as num).toDouble(),
);

Map<String, dynamic> _$MethodParamsToJson(MethodParams instance) =>
    <String, dynamic>{'Fajr': instance.fajr, 'Isha': instance.isha};

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
);

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
  'latitude': instance.latitude,
  'longitude': instance.longitude,
};

Offset _$OffsetFromJson(Map<String, dynamic> json) => Offset(
  imsak: (json['Imsak'] as num).toInt(),
  fajr: (json['Fajr'] as num).toInt(),
  sunrise: (json['Sunrise'] as num).toInt(),
  dhuhr: (json['Dhuhr'] as num).toInt(),
  asr: (json['Asr'] as num).toInt(),
  maghrib: (json['Maghrib'] as num).toInt(),
  sunset: (json['Sunset'] as num).toInt(),
  isha: (json['Isha'] as num).toInt(),
  midnight: (json['Midnight'] as num).toInt(),
);

Map<String, dynamic> _$OffsetToJson(Offset instance) => <String, dynamic>{
  'Imsak': instance.imsak,
  'Fajr': instance.fajr,
  'Sunrise': instance.sunrise,
  'Dhuhr': instance.dhuhr,
  'Asr': instance.asr,
  'Maghrib': instance.maghrib,
  'Sunset': instance.sunset,
  'Isha': instance.isha,
  'Midnight': instance.midnight,
};
