import 'dart:async';
import 'dart:developer';

import 'package:dua_zekr/features/salah_time/data/models/prayer_times_response.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin
  flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  static final StreamController<NotificationResponse>
  streamController = StreamController.broadcast();

  static void onTap(NotificationResponse response) {
    streamController.add(response);
  }

  /// 🔹 init
  static Future<void> init() async {
    const InitializationSettings settings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );

    await flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: onTap,
      onDidReceiveBackgroundNotificationResponse: onTap,
    );

    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Africa/Cairo'));

    log('✅ LocalNotificationService initialized');
  }

  /// 🔹 إشعار فوري
  static Future<void> showBasicNotification() async {
    const android = AndroidNotificationDetails(
      'basic_channel',
      'Basic Notifications',
      channelDescription: 'Basic notification channel',
      importance: Importance.max,
      priority: Priority.high,
    );

    await flutterLocalNotificationsPlugin.show(
      0,
      '✅ إشعار فوري',
      'تم إرسال الإشعار بنجاح',
      const NotificationDetails(android: android),
    );
  }

  /// 🔹 إشعار بعد وقت (مثلاً بعد 10 ثواني)
  static Future<void> showScheduledNotification() async {
    const android = AndroidNotificationDetails(
      'scheduled_channel',
      'Scheduled Notifications',
      channelDescription: 'Scheduled notification channel',
      importance: Importance.max,
      priority: Priority.high,
    );

    final scheduledTime =
    tz.TZDateTime.now(tz.local).add(const Duration(seconds: 10));

    await flutterLocalNotificationsPlugin.zonedSchedule(
      2,
      '⏰ إشعار مجدول',
      'وصل الإشعار بعد 10 ثواني',
      scheduledTime,
      const NotificationDetails(android: android),
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
    );
  }

  /// 🔹 إشعار متكرر (بديل periodicallyShow)
  static Future<void> showRepeatedNotification() async {
    const android = AndroidNotificationDetails(
      'repeated_channel_test',
      'Repeated Test',
      channelDescription: 'Repeated test notification',
      importance: Importance.max,
      priority: Priority.high,
    );

    final now = tz.TZDateTime.now(tz.local);
    final scheduledTime = now.add(const Duration(seconds: 5));

    await flutterLocalNotificationsPlugin.zonedSchedule(
      100,
      '🔔 اختبار إشعار',
      'الإشعار اشتغل ✔',
      scheduledTime,
      const NotificationDetails(android: android),
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,

    );
  }

  /// 🔹 Schedule "Pray on the Prophet" every minute
  static Future<void> scheduleEveryMinuteZikr() async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'every_minute_channel',
      'Minute Zikr',
      channelDescription: 'Reminds you to pray on the Prophet every minute',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    await flutterLocalNotificationsPlugin.periodicallyShow(
      0,
      'تذكير',
      'صلي علي النبي',
      RepeatInterval.hourly,
      notificationDetails,
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
    );
  }

  /// 🔹 Schedule notification 10 minutes before Salah
  static Future<void> schedulePrayerNotification(
      int id, String title, String body, DateTime scheduledTime) async {
        
    final prayerTimeMinus10 = scheduledTime.subtract(const Duration(minutes: 10));
    
    // Ensure we don't schedule in the past
    if (prayerTimeMinus10.isBefore(DateTime.now())) {
      return;
    }

    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'prayer_channel',
      'Prayer Times',
      channelDescription: 'Reminds you before Salah',
      importance: Importance.max,
      priority: Priority.high,
      sound: RawResourceAndroidNotificationSound('adhan'),
    );
    
    // const DarwinNotificationDetails darwinNotificationDetails =
    //    DarwinNotificationDetails(sound: 'adhan.aiff');

    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      // iOS: darwinNotificationDetails,
    );

    try {
      await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        tz.TZDateTime.from(prayerTimeMinus10, tz.local),
        notificationDetails,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        matchDateTimeComponents: DateTimeComponents.time,
      );
    } catch (e) {
       log('⚠️ Failed to schedule with custom sound/exact alarm: $e. Retrying with default sound & inexact mode.');
      
      // Fallback: Default sound + Inexact mode
      const AndroidNotificationDetails fallbackAndroidDetails =
          AndroidNotificationDetails(
        'prayer_channel_default',
        'Prayer Times (Default)',
        channelDescription: 'Reminds you before Salah (Default Sound)',
        importance: Importance.max,
        priority: Priority.high,
      );
      const NotificationDetails fallbackDetails =
          NotificationDetails(android: fallbackAndroidDetails);

      await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        tz.TZDateTime.from(prayerTimeMinus10, tz.local),
        fallbackDetails,
        androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
        matchDateTimeComponents: DateTimeComponents.time,
      );
    }
  }

  /// 🔹 Schedule all prayers for the day
  static Future<void> scheduleAllPrayers(Timings timings) async {
    final now = DateTime.now();
    final Map<String, String> prayerTimesMap = timings.toMap();

    int idCounter = 1;
    for (var entry in prayerTimesMap.entries) {
      final name = entry.key;
      final timeStr = entry.value; // "HH:mm"

      // Basic filtering for main prayers
      if (!['Fajr', 'Dhuhr', 'Asr', 'Maghrib', 'Isha'].contains(name)) {
        continue;
      }

      final parts = timeStr.split(':');
      final hour = int.parse(parts[0]);
      final minute = int.parse(parts[1].split(' ')[0]);

      final prayerDate = DateTime(now.year, now.month, now.day, hour, minute);

      await schedulePrayerNotification(
        idCounter,
        'اقتربت الصلاة',
        'باقي 10 دقائق على صلاة $name',
        prayerDate,
      );

      idCounter++;
    }
  }

  /// 🔹 إلغاء إشعار
  static Future<void> cancel(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  /// 🔹 إلغاء الكل
  static Future<void> cancelAll() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}
