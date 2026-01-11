import 'package:dua_zekr/features/salah_time/data/models/prayer_times_response.dart';
import 'package:dua_zekr/features/salah_time/doamin/entity/prayer_data.dart';

extension PrayerResponseToDataMapper on PrayerTimesData {
  PrayerData toEntity() {
    return PrayerData(dateInfo: date, timings: timings);
  }
}
