import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/text_theme/text_style.dart';
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
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: ListTile(
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
                  color: AppColors.mainColor,
                ),
                child: Center(
                  child: InkWell(
                    onTap: () {
                      expand.value = !expand.value;
                    },
                    child: Text(
                      (++index).toString(),
                      style: AppTextStyle.font12GreyBold,
                    ),
                  ),
                ),
              ),
              title: GestureDetector(
                onTap: (){
                  expand.value = !expand.value;
                },
                child: Expanded(
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
