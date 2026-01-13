import 'package:dio/dio.dart';
import 'package:dua_zekr/core/const/api_pray_const.dart';
import 'package:dua_zekr/core/service/local_notification.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workmanager/workmanager.dart';

import '../../features/salah_screen/data/service/get_prayer_times.dart';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    try {
      if (task == 'prayer_check_task') {
        // 1. Initialize dependencies
        final prefs = await SharedPreferences.getInstance();
        final double? lat = prefs.getDouble('cached_lat');
        final double? lng = prefs.getDouble('cached_lng');

        if (lat == null || lng == null) {
          return Future.value(false);
        }

        final dio = Dio();
        dio.options.baseUrl = ApiConstPray.apiBaseUrl;
        
        final getPrayerTimesService = GetPrayerTimesService(dio);
        
        // Initialize Notification Service (Static)
        await LocalNotificationService.init();

        // 2. Fetch Prayer Times
        final response = await getPrayerTimesService.getPrayerTimes(lat: lat, lng: lng);
        final timings = response.data.timings;

        // 3. Schedule Notifications
        await LocalNotificationService.scheduleAllPrayers(timings);
      }
    } catch (e) {
      print('Background task error: $e');
      return Future.value(false);
    }
    return Future.value(true);
  });
}



class BackgroundService {
  static final BackgroundService _instance = BackgroundService._internal();

  factory BackgroundService() {
    return _instance;
  }

  BackgroundService._internal();

  Future<void> initialize() async {
    await Workmanager().initialize(
      callbackDispatcher,
      isInDebugMode: false,
    );
  }

  Future<void> registerPeriodicTask() async {
    await Workmanager().registerPeriodicTask(
      'prayer_check_periodic',
      'prayer_check_task',
      frequency: const Duration(hours: 12),
      constraints: Constraints(
        networkType: NetworkType.connected,
      ),
      initialDelay: const Duration(seconds: 10),
    );
  }
}
