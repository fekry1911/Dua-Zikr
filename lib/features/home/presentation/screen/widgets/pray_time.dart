import 'package:dua_zekr/core/theme/text_theme/text_style.dart';
import 'package:dua_zekr/features/salah_time/presentation/logic/get_prayers_time_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class PrayTime extends StatelessWidget {
  const PrayTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          var time = DateTime.now();
          print("${time.hour}:${time.minute}");
        },
        child: SizedBox(
          width: double.infinity,
          height: 150.h,
          child: Stack(
            children: [
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: SvgPicture.asset(
                    "assets/svg/home.svg",
                    colorFilter: ColorFilter.mode(
                      Colors.teal.shade300,
                      BlendMode.color,
                    ),
                    fit: BoxFit.cover, // ← أفضل من fill
                  ),
                ),
              ),

              Positioned(
                bottom: 0,
                left: 8,
                right: 0,
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: 25.0.w),
                        child:
                            BlocBuilder<
                              GetPrayersTimeCubit,
                              GetPrayersTimeState
                            >(
                              builder: (context, state) {
                                if (state.isLoading) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }

                                if (state.error != null) {
                                  return Center(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(state.error!),
                                        TextButton(
                                          onPressed: () {
                                            context
                                                .read<GetPrayersTimeCubit>()
                                                .getPrayerTimes();
                                          },
                                          child: Text("try again"),
                                        ),
                                      ],
                                    ),
                                  );
                                }

                                if (state.data == null) {
                                  return const SizedBox();
                                }
                                final currentPrayer = state.currentPrayer ?? '';
                                final nextPrayer = state.nextPrayer ?? '';
                                final nextPrayerTime = state.nextPrayerTime;
                                final nowPrayerTime = state.currentPrayerTime;

                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.currentPrayer ?? '',
                                      style: AppTextStyle.font14BlackMedium,
                                    ),
                                    Text(
                                      state.currentPrayerTime != null
                                          ? DateFormat.Hm().format(
                                              state.currentPrayerTime!,
                                            )
                                          : "--:--",
                                      style: AppTextStyle.font36BlackSemiBold,
                                    ),
                                    SizedBox(height: 6.h),
                                    Text(
                                      "الصلاة التالية: ${state.nextPrayer}",
                                      style: AppTextStyle.font14BlackRegular,
                                    ),
                                    SizedBox(height: 6.h),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        nextPrayerTime != null
                                            ? DateFormat.jm().format(
                                                nextPrayerTime,
                                              )
                                            : "--:--",
                                        style: AppTextStyle.font14BlackBold,
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                      ),
                    ),

                    Image.asset(
                      "assets/images/png_masged.png",
                      width: 180.w,
                      height: 130.h,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
