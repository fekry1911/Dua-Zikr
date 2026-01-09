import 'package:dua_zekr/core/theme/colors.dart';
import 'package:flutter/src/painting/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'font_weight.dart';

class AppTextStyle {
  static final TextStyle font24BlackBold = GoogleFonts.alexandria(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.BlackColor,
  );
  static final TextStyle font16BlackBold = GoogleFonts.alexandria(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.BlackColor,
  );
  static final TextStyle font12GreyBold = GoogleFonts.alexandria(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.secondTextColor,
  );
  static final TextStyle font20GreyBold = GoogleFonts.alexandria(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.secondTextColor,
  );
  static final TextStyle font14BlackBold = GoogleFonts.alexandria(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.BlackColor,
  );
  static final TextStyle font11GreyBold = GoogleFonts.alexandria(
    fontSize: 11.sp,
    height: 2,
    letterSpacing: .5,

    fontWeight: FontWeightHelper.bold,
    color: AppColors.secondTextColor,
  );
  static final TextStyle font18BlackBold = GoogleFonts.alexandria(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.BlackColor,
  );
  static final TextStyle font20BlackRegular= GoogleFonts.neuton(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.BlackColor,
  );
}//Neirizi
