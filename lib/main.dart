import 'package:device_preview/device_preview.dart';
import 'package:dua_zekr/core/di/di.dart';
import 'package:dua_zekr/features/home_screen/logic/home_cubit.dart';
import 'package:dua_zekr/features/home_screen/presentation/home.dart';
import 'package:dua_zekr/features/splash.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import 'core/service/local_notification.dart';
import 'core/theme/colors.dart';
import 'features/all_ahadeth/presentation/logic/all_ahadeeth_cubit.dart';
import 'features/favorites/presentation/logic/manage_fav_cubit.dart';
import 'features/home/presentation/logic/categories_cubit.dart';
import 'features/home/presentation/logic/get_dua_cubit.dart';

// ✅ استورد الاتنين بنفس الاسم
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import 'core/service/background_service.dart';
import 'features/salah_screen/presentation/logic/get_prayers_time_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await LocalNotificationService.init();
  await BackgroundService().initialize();
  await BackgroundService().registerPeriodicTask();
  
  final androidPlugin =
      LocalNotificationService.flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>();

  await androidPlugin?.requestNotificationsPermission();
  await Permission.scheduleExactAlarm.request();
  
  // Schedule "Every Minute" Zikr

  setUp();

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return BlocProvider(
          create: (context) =>
          sl<ManageFavCubit>()
            ..loadFavorites(),
          child: MaterialApp(
            useInheritedMediaQuery: true,
            debugShowCheckedModeBanner: false,
            title: 'ITI Moqaf',
            locale: DevicePreview.locale(context),
            supportedLocales: const [Locale('ar')],
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            builder: (context, child) {
              // Directionality + DevicePreview
              return Directionality(
                textDirection: TextDirection.rtl,
                child: DevicePreview.appBuilder(context, child),
              );
            },
            home: SplashScreen(),
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                elevation: 0,
                backgroundColor: AppColors.mainColor,
              ),
              useMaterial3: true,
              scaffoldBackgroundColor: AppColors.mainColor,
              cardTheme: CardThemeData(color: AppColors.cardColor),
              pageTransitionsTheme: const PageTransitionsTheme(
                builders: {
                  TargetPlatform.android: ZoomPageTransitionsBuilder(),
                  TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
