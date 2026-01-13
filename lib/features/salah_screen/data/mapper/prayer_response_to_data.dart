
import '../../doamin/entity/prayer_data.dart';
import '../models/prayer_times_response.dart';

extension PrayerResponseToDataMapper on PrayerTimesData {
  PrayerData toEntity() {
    return PrayerData(dateInfo: date, timings: timings);
  }
}
