import 'package:dua_zekr/core/helpers/navigation/calm.dart';
import 'package:dua_zekr/core/theme/text_theme/text_style.dart';
import 'package:dua_zekr/features/duas/presentation/logic/all_duas_cate_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/di/di.dart';
import '../../../../duas/presentation/screens/adkhars.dart';

class AzkarCateCard extends StatelessWidget {
  AzkarCateCard({
    super.key,
    required this.image,
    required this.title,
    required this.jsonFileName,
  });

  String image;
  String title;
  String jsonFileName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          CalmPageRoute(
            page: BlocProvider(
              create: (context) =>
                  sl<AllDuasCateCubit>()..getDuas(jsonFileName),
              child: AdhkarListScreen(),
            ),
          ),
        );
      },
      child: Card(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              image,
              color: Colors.teal,
              semanticsLabel: 'Dart Logo',
              width: 30.w,
              height: 30.h,
            ),
            SizedBox(height: 8.h),
            Text(title, style: AppTextStyle.font11GreyBold),
          ],
        ),
      ).animate().scaleXY(),
    );
  }
}

List<Map<String, String>> data = [
  {
    "image": "assets/svg/quran.svg",
    "title": "ادعيه قران",
    "jsonFileName": "assets/dua_data/quran_dus.json",
  },
  {
    "image": "assets/svg/masa.svg",
    "title": "اذكار المساء",
    "jsonFileName": "assets/dua_data/massa.json",
  },
  {
    "image": "assets/svg/sabah.svg",
    "title": "اذكار الصباح",
    "jsonFileName": "assets/dua_data/sabah.json",
  },
  {
    "image": "assets/svg/salah.svg",
    "title": "اذكار الصلاه",
    "jsonFileName": "assets/dua_data/after_salah.json",
  },
  {
    "image": "assets/svg/tasbeh.svg",
    "title": "تسابيح",
    "jsonFileName": "assets/dua_data/tasbeh.json",
  },
  {
    "image": "assets/svg/dua.svg",
    "title": "ادعيه الانبياء",
    "jsonFileName": "assets/dua_data/nabe_dua.json",
  },
  {
    "image": "assets/svg/sleep.svg",
    "title": "اذكار النوم",
    "jsonFileName": "assets/dua_data/sleep.json",
  },
  {
    "image": "assets/svg/wake.svg",
    "title": "اذكار الاستيقاظ",
    "jsonFileName": "assets/dua_data/wake.json",
  },
];
