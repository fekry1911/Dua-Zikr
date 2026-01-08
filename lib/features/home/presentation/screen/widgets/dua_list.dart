import 'package:auto_size_text/auto_size_text.dart';
import 'package:dua_zekr/core/theme/text_theme/text_style.dart';
import 'package:dua_zekr/features/home/presentation/logic/get_dua_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/models/dua_model.dart';

class DuaList extends StatelessWidget {
  const DuaList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetDuaCubit, GetDuaState>(
      builder: (context, state) {
        if (state is GetDuaLoading) {
          return Center(child: CircularProgressIndicator());
        }
        List<Dua> duaList = (state as GetDuaSuccess).duas;

        return Container(
          height: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30.r)),
          ),
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: 290,

                child: Card(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          duaList[index].reason,
                          style: AppTextStyle.font16BlackBold,
                          maxLines: 1
                        ),
                        SizedBox(height: 5.h,),
                        AutoSizeText(
                          maxLines: 2,
                          duaList[index].text,
                          style: AppTextStyle.font11GreyBold,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            itemCount: duaList.length,
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(width: 10);
            },
          ),
        );
      },
    );
  }
}
