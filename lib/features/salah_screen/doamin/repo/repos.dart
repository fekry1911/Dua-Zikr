import 'package:dartz/dartz.dart';

import '../../../../core/network/failuer.dart';
import '../entity/prayer_data.dart';

abstract class GetPrayTimesRepo{
  Future<Either<Failure, PrayerData>> getPrayerTimes(double lat, double lng);
}