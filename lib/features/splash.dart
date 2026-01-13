import 'package:dua_zekr/core/helpers/navigation/calm.dart';
import 'package:dua_zekr/core/theme/colors.dart';
import 'package:dua_zekr/core/theme/text_theme/text_style.dart';
import 'package:dua_zekr/features/salah_screen/presentation/logic/get_prayers_time_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../core/di/di.dart';
import '../core/service/local_notification.dart';
import 'home/presentation/logic/categories_cubit.dart';
import 'home/presentation/logic/get_dua_cubit.dart';
import 'home_screen/logic/home_cubit.dart';
import 'home_screen/presentation/home.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greenColor,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 80,
              left: 40,
              child: SvgPicture.asset("assets/svg/Container.svg")
                  .animate(
                    onPlay: (controller) => controller.repeat(reverse: true),
                  )
                  .scale(
                    begin: const Offset(0.8, 0.8),
                    end: const Offset(1.2, 1.2),
                    duration: 600.ms,
                    curve: Curves.easeInOut,
                  ),
            ),
            Positioned(
              bottom: 80,
              right: 40,
              child: SvgPicture.asset("assets/svg/Container.svg")
                  .animate(
                    onPlay: (controller) => controller.repeat(reverse: true),
                  )
                  .scale(
                    begin: const Offset(0.8, 0.8),
                    end: const Offset(1.2, 1.2),
                    duration: 600.ms,
                    curve: Curves.easeInOut,
                  ),
            ),
            SvgPicture.asset("assets/svg/Container2.svg"),
            Container(
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.deepGreenColor.withOpacity(.8),
                    AppColors.lightGreenColor.withOpacity(.8),
                    AppColors.greenColor.withOpacity(.8),
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  SizedBox(height: 40.h),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100.r),
                    child: Image.asset(
                      "assets/images/splash.png",
                      width: 120.w,
                      height: 100.h,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "دعاء و ذكر",
                    style: AppTextStyle.font20GreyBold.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () async {
                      Navigator.push(
                        context,
                        CalmPageRoute(
                          page: MultiBlocProvider(
                            providers: [
                              BlocProvider(
                                create: (context) => HomeCubit(),
                              ),
                              BlocProvider(
                                create: (context) =>
                                sl<CategoriesCubit>()
                                  ..getAllCategoriesData(),
                              ),
                              BlocProvider(
                                create: (context) =>
                                sl<GetDuaCubit>()..getDuaData(),
                              ),
                              BlocProvider(
                                create: (context) =>
                                sl<GetPrayersTimeCubit>()
                                  ..getPrayerTimes(),
                              ),
                            ],
                            child: HomeScreen(),
                          ),
                        ),
                      );
                      await LocalNotificationService.scheduleEveryMinuteZikr();

                    },
                    child: Text(
                      "اضغط للبدأ",
                      style: AppTextStyle.font20GreyBold.copyWith(
                        fontSize: 15.sp,
                      ),
                    ),
                  )
                      .animate(
                    onPlay: (controller) =>
                        controller.repeat(reverse: true),
                  )
                      .fade(duration: 2000.ms),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
* MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => HomeCubit(),
                ),
                BlocProvider(
                  create: (context) =>
                  sl<CategoriesCubit>()
                    ..getAllCategoriesData(),
                ),
                BlocProvider(create: (context) =>
                sl<GetDuaCubit>()
                  ..getDuaData()),
                BlocProvider(create: (context) =>
                sl<GetPrayersTimeCubit>()
                  ..getPrayerTimes()),
              ],
              child: HomeScreen(),
            )*/
