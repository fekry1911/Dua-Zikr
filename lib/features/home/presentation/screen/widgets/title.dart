import 'package:dua_zekr/core/helpers/navigation/calm.dart';
import 'package:dua_zekr/features/all_ahadeth/presentation/screen/all_ahadith.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/di/di.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/text_theme/text_style.dart';
import '../../../../all_ahadeth/presentation/logic/all_ahadeeth_cubit.dart';

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
                Navigator.push(
                  context,
                  CalmPageRoute(
                    page: BlocProvider(
                      create: (context) =>
                          sl<AllAhadeethCubit>()..getAllAhadeeth(),
                      child: AllAhadith(),
                    ),
                  ),
                );
              },
              child: Text("عرض الكل", style: AppTextStyle.font12GreyBold),
            ),
          ],
        ),
        SizedBox(height: 10.h),
      ],
    );
  }
}
