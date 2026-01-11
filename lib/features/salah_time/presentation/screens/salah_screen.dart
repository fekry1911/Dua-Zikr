import 'package:dua_zekr/core/theme/text_theme/text_style.dart';
import 'package:dua_zekr/core/widgets/loading.dart';
import 'package:dua_zekr/features/salah_time/presentation/screens/widgets/clock.dart';
import 'package:dua_zekr/features/salah_time/presentation/screens/widgets/salah_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../logic/get_prayers_time_cubit.dart';

class SalahScreen extends StatelessWidget {
  const SalahScreen({super.key});

  String formatRemaining(Duration d) {
    final h = d.inHours;
    final m = d.inMinutes.remainder(60);
    return h > 0 ? "$h ساعة و $m دقيقة" : "$m دقيقة";
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetPrayersTimeCubit, GetPrayersTimeState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: SharedLoading());
        }

        if (state.data == null) {
          return const SizedBox();
        }

        final timings = state.data!.timings;

        final prayers = [
          PrayerItem(name: 'الفجر', time: timings.fajr, icon: Icons.nightlight),
          PrayerItem(name: 'الظهر', time: timings.dhuhr, icon: Icons.wb_sunny),
          PrayerItem(name: 'العصر', time: timings.asr, icon: Icons.cloud),
          PrayerItem(name: 'المغرب', time: timings.maghrib, icon: Icons.wb_sunny_outlined),
          PrayerItem(name: 'العشاء', time: timings.isha, icon: Icons.dark_mode),
        ];

        return ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${state.data!.dateInfo.gregorian.day} "
                      "${state.data!.dateInfo.gregorian.month.en} "
                      "${state.data!.dateInfo.gregorian.year}",
                  style: AppTextStyle.font12GreyRegular,
                ),
                SizedBox(height: 4.h),
                Text(
                  "${state.data!.dateInfo.hijri.day} "
                      "${state.data!.dateInfo.hijri.weekday.ar} "
                      "${state.data!.dateInfo.hijri.month.ar} "
                      "${state.data!.dateInfo.hijri.year}",
                  style: AppTextStyle.font14BlackBold,
                ),
              ],
            ),

            SizedBox(height: 20.h),

            ClockWidget(),

            SizedBox(height: 20.h),

            if (state.remainingTime != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("الوقت المتبقي لصلاة "),
                  Text(
                    state.nextPrayer ?? "",
                    style: AppTextStyle.font14BlackBold,
                  ),
                  SizedBox(width: 8.w),
                  Text(formatRemaining(state.remainingTime!)),
                ],
              ),

            SizedBox(height: 20.h),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: prayers.length,
              itemBuilder: (context, index) {
                return PrayerRow(
                  prayer: prayers[index],
                  current: state.nextPrayer!,
                );
              },
            ),
          ],
        );
      },
    );
  }
}
