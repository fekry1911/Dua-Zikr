import 'package:auto_size_text/auto_size_text.dart';
import 'package:dua_zekr/features/home/data/models/hadith_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/hadeeths_of_category/presentation/logic/ahadeeths_cubit.dart';
import '../../features/hadeeths_of_category/presentation/screens/ahadeeths_screen.dart';
import '../di/di.dart';
import '../helpers/navigation/calm.dart';
import '../theme/text_theme/text_style.dart';

class CateCard extends StatelessWidget {
  CateCard({super.key, required this.data, required this.index});

  HadithCategory data;
  int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          CalmPageRoute(
            page: BlocProvider(
              create: (BuildContext context) =>
                  sl<AhadeethsCubit>()..loadFirstPage(data.id),
              child: AllAhadeethOfCategory(categoryId: data.id,),
            ),
          ),
        );
      },
      child: Card(
        key: ValueKey(index),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              AutoSizeText(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                data.title,
                style: AppTextStyle.font14BlackBold,
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data.hadeethsCount.toString(),
                    style: AppTextStyle.font14BlackBold,
                  ),
                  Text("حديث", style: AppTextStyle.font12GreyBold),
                ],
              ),
            ],
          ),
        ),
      ).animate().scaleXY(duration: Duration(milliseconds: 600)),
    );
  }
}
