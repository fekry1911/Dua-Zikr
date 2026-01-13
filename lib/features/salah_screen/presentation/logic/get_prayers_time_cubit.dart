import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/service/alarm.dart';
import '../../../../core/service/local_notification.dart';
import '../../data/models/prayer_times_response.dart';
import '../../doamin/entity/prayer_data.dart';
import '../../doamin/usecases/get_prayers_time.dart';

part 'get_prayers_time_state.dart';

class GetPrayersTimeCubit extends Cubit<GetPrayersTimeState> {
  final GetPrayerTimesUseCase getPrayerTimesUseCase;

  GetPrayersTimeCubit(this.getPrayerTimesUseCase)
      : super(GetPrayersTimeState.initial());

  Future<void> getPrayerTimes() async {
    emit(state.copyWith(isLoading: true, error: null));

    final result = await getPrayerTimesUseCase.call();

    result.fold(
          (failure) {
        emit(state.copyWith(
          isLoading: false,
          error: failure.message,
        ));
      },
            (data) async {
          final info = _calculatePrayers(data.timings);

          final timingsMap = {
            'Fajr': data.timings.fajr,
            'Dhuhr': data.timings.dhuhr,
            'Asr': data.timings.asr,
            'Maghrib': data.timings.maghrib,
            'Isha': data.timings.isha,
          };
          // Schedule notifications for the fetched prayer times
          await LocalNotificationService.scheduleAllPrayers(data.timings);
          emit(state.copyWith(
            isLoading: false,
            data: data,
            currentPrayer: info.currentPrayer,
            nextPrayer: info.nextPrayer,
            currentPrayerTime: info.currentPrayerTime,
            nextPrayerTime: info.nextPrayerTime,
            remainingTime: info.remainingTime,
          ));
        }
    );
  }

  PrayerInfo _calculatePrayers(Timings timings) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    final prayers = <PrayerInfoItem>[
      PrayerInfoItem('الفجر', timings.fajr),
      PrayerInfoItem('الظهر', timings.dhuhr),
      PrayerInfoItem('العصر', timings.asr),
      PrayerInfoItem('المغرب', timings.maghrib),
      PrayerInfoItem('العشاء', timings.isha),
    ];

    final times = prayers.map((p) {
      final parts = p.time.split(":");
      return p.copyWith(
        dateTime: today.add(
          Duration(
            hours: int.parse(parts[0]),
            minutes: int.parse(parts[1]),
          ),
        ),
      );
    }).toList();

    PrayerInfoItem? current;
    PrayerInfoItem? next;

    for (final p in times) {
      if (now.isBefore(p.dateTime)) {
        next = p;
        break;
      }
      current = p;
    }

    // بعد العشاء
    current ??= times.last;
    next ??= times.first.copyWith(
      dateTime: times.first.dateTime.add(const Duration(days: 1)),
    );

    final remaining = next.dateTime.difference(now);

    return PrayerInfo(
      currentPrayer: current.name,
      nextPrayer: next.name,
      currentPrayerTime: current.dateTime,
      nextPrayerTime: next.dateTime,
      remainingTime: remaining,
    );
  }
}

class PrayerInfo {
  final String currentPrayer;
  final String nextPrayer;
  final DateTime currentPrayerTime;
  final DateTime nextPrayerTime;
  final Duration remainingTime;

  PrayerInfo({
    required this.currentPrayer,
    required this.nextPrayer,
    required this.currentPrayerTime,
    required this.nextPrayerTime,
    required this.remainingTime,
  });
}

class PrayerInfoItem {
  final String name;
  final String time;
  final DateTime dateTime;

  PrayerInfoItem(
      this.name,
      this.time, {
        DateTime? dateTime,
      }) : dateTime = dateTime ?? DateTime.now();

  PrayerInfoItem copyWith({DateTime? dateTime}) {
    return PrayerInfoItem(
      name,
      time,
      dateTime: dateTime ?? this.dateTime,
    );
  }
}
