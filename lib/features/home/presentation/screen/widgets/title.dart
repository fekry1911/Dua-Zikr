import 'package:dua_zekr/features/home_screen/logic/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/text_theme/text_style.dart';

class TitleText extends StatelessWidget {
  TitleText({super.key, required this.title});

  String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        Row(
          children: [
            Text(
              title,
              style: AppTextStyle.font20GreyBold.copyWith(
                color: AppColors.BlackColor,
              ),
            ),
            Spacer(),
            TextButton(
              onPressed: () {
                context.read<HomeCubit>().setIndex(1);
              },
              child: Text(
                "عرض الكل",
                style: AppTextStyle.font12GreyBold
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
      ],
    );
  }
}
