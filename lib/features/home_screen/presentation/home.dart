import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:dua_zekr/core/theme/text_theme/text_style.dart';
import 'package:dua_zekr/features/all_ahadeth/presentation/screen/all_ahadith.dart';
import 'package:dua_zekr/features/favorites/presentation/screen/favorites.dart';
import 'package:dua_zekr/features/home_screen/logic/home_cubit.dart';
import 'package:dua_zekr/features/home_screen/presentation/widgets/bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../home/presentation/screen/all_categories.dart';
import '../../salah_time/presentation/screens/salah_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List<Widget> pages = [AllCategories(), SalahScreen(), Favorites()];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        int index = context.read<HomeCubit>().index;

        return Scaffold(
          extendBody: true,
          appBar: index == 0
              ? null
              : AppBar(
                  title: Text(
                    index == 1 ? "الاحاديث" : "المفضله",
                    style: AppTextStyle.font16BlackBold,
                  ),
                ),
          body: IndexedStack(index: index, children: pages),
          bottomNavigationBar: CurvedNavigationBar(
            color: Colors.white,
            backgroundColor: Colors.transparent,
            buttonBackgroundColor: Colors.white,
            animationDuration: Duration(milliseconds: 500),
            animationCurve: Curves.decelerate,
            letIndexChange: (index) => true,
            index: index,
            height: 60.h,
            items: bottomBarItem,
            onTap: (index) {
              context.read<HomeCubit>().setIndex(index);
            },
          ),
        );
      },
    );
  }
}
