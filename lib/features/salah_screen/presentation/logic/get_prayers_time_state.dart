part of 'get_prayers_time_cubit.dart';

@immutable
class GetPrayersTimeState {
  final PrayerData? data;
  final bool isLoading;
  final String? error;

  final String? currentPrayer;
  final String? nextPrayer;
  final DateTime? currentPrayerTime;
  final DateTime? nextPrayerTime;
  final Duration? remainingTime;

  const GetPrayersTimeState({
    required this.data,
    required this.isLoading,
    required this.error,
    this.currentPrayer,
    this.nextPrayer,
    this.currentPrayerTime,
    this.nextPrayerTime,
    this.remainingTime,
  });

  factory GetPrayersTimeState.initial() {
    return const GetPrayersTimeState(
      data: null,
      isLoading: false,
      error: null,
    );
  }

  GetPrayersTimeState copyWith({
    PrayerData? data,
    bool? isLoading,
    String? error,
    String? currentPrayer,
    String? nextPrayer,
    DateTime? currentPrayerTime,
    DateTime? nextPrayerTime,
    Duration? remainingTime,
  }) {
    return GetPrayersTimeState(
      data: data ?? this.data,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      currentPrayer: currentPrayer ?? this.currentPrayer,
      nextPrayer: nextPrayer ?? this.nextPrayer,
      currentPrayerTime:
      currentPrayerTime ?? this.currentPrayerTime,
      nextPrayerTime: nextPrayerTime ?? this.nextPrayerTime,
      remainingTime: remainingTime ?? this.remainingTime,
    );
  }
}