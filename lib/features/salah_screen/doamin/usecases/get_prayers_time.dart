import 'package:dartz/dartz.dart';
import '../../../../core/helpers/location_service.dart';
import '../../../../core/network/failuer.dart';
import '../entity/prayer_data.dart';
import '../repo/repos.dart';

class GetPrayerTimesUseCase {
  final GetPrayTimesRepo repo;
  final LocationService locationService;

  GetPrayerTimesUseCase(
      this.repo,
      this.locationService,
      );

  Future<Either<Failure, PrayerData>> call() async {
    try {
      final position = await locationService.getCurrentLocation();
      var data=await  repo.getPrayerTimes(
        position.latitude,
        position.longitude,
      );
      print(data);
      return data;
    } catch (e) {
      return Left(
        LocationFailure(e.toString()),
      );
    }
  }
}
