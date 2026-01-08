import 'package:device_preview/device_preview.dart';
import 'package:dua_zekr/core/di/di.dart';
import 'package:dua_zekr/features/home_screen/logic/home_cubit.dart';
import 'package:dua_zekr/features/home_screen/presentation/home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/theme/colors.dart';
import 'features/home/presentation/logic/categories_cubit.dart';
import 'features/home/presentation/logic/get_dua_cubit.dart';
import 'features/home/presentation/screen/all_categories.dart';

void main() {
  setUp(); // لو عندك DI setup
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(),
    ),
  );
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
        return MaterialApp(
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
          home: BlocProvider(
            create: (context) => HomeCubit(),
            child: HomeScreen(),
          ),
          theme: ThemeData(
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
        );
      },
    );
  }
}
