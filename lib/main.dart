import 'package:device_preview/device_preview.dart';
import 'package:dua_zekr/core/di/di.dart';
import 'package:dua_zekr/features/home_screen/logic/home_cubit.dart';
import 'package:dua_zekr/features/home_screen/presentation/home.dart';
import 'package:dua_zekr/features/salah_time/presentation/logic/get_prayers_time_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/theme/colors.dart';
import 'features/all_ahadeth/presentation/logic/all_ahadeeth_cubit.dart';
import 'features/favorites/presentation/logic/manage_fav_cubit.dart';
import 'features/home/presentation/logic/categories_cubit.dart';
import 'features/home/presentation/logic/get_dua_cubit.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUp();
  runApp(
    DevicePreview(enabled: !kReleaseMode, builder: (context) => const MyApp()),
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
            home: MultiBlocProvider(
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
            ),
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
