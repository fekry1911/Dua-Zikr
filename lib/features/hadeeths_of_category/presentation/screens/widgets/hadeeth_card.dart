import 'package:dua_zekr/core/helpers/navigation/calm.dart';
import 'package:dua_zekr/features/favorites/presentation/logic/manage_fav_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/di/di.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/text_theme/text_style.dart';
import '../../../../hadeeth_details/presentation/logic/hadeeth_details_cubit.dart';
import '../../../../hadeeth_details/presentation/screens/hadeeth_details.dart';
import '../../../domain/entity/hadeeth_data.dart';

class HadeethCard extends StatelessWidget {
  HadeethCard({super.key, required this.index, required this.data});

  int index;
  HadeethData data;
  ValueNotifier<bool> expand = ValueNotifier(false);


  @override
  Widget build(BuildContext context) {
    return Card(
          key: ValueKey(index),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: ListTile(
              trailing: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    CalmPageRoute(
                      page: MultiBlocProvider(
                        providers: [
                          BlocProvider(
                            create: (context) =>
                                sl<HadeethDetailsCubit>()
                                  ..getHadeethDetailsData(data.id),
                          ),
                          BlocProvider.value(value: context.read<ManageFavCubit>()),
                        ],
                        child: HadeethDetails(),
                      ),
                    ),
                  );
                },
                icon: Icon(Icons.arrow_forward_ios),
              ),
              leading: Container(
                width: 25.w,
                height: 25.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                    ),
                    BoxShadow(
                      color: Colors.white.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                    ),
                  ],
                  color: AppColors.avatarColor,
                ),
                child: Center(
                  child: Text(
                    (++index).toString(),
                    style: AppTextStyle.font12GreyBold,
                  ),
                ),
              ),
              title: GestureDetector(
                onTap: () {
                  expand.value = !expand.value;
                },
                child: Hero(
                  tag: data.id,
                  child: ValueListenableBuilder(
                    valueListenable: expand,
                    builder: (context, value, child) {
                      return AnimatedSize(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.decelerate,
                        child: Text(
                          data.title,
                          style: AppTextStyle.font12GreyBold,
                          maxLines: expand.value ? 100 : 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        )
        .animate(delay: Duration(milliseconds: 100))
        .fade(duration: 400.ms, curve: Curves.easeOut)
        .scaleXY(duration: 400.ms, curve: Curves.easeOut);
  }
}
