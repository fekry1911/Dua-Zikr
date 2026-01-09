import 'package:dua_zekr/features/hadeeth_details/presentation/screens/widget/hadeeth_card.dart';
import 'package:dua_zekr/features/hadeeth_details/presentation/screens/widget/hadeeth_section.dart';
import 'package:dua_zekr/features/hadeeth_details/presentation/screens/widget/hint_section.dart';
import 'package:dua_zekr/features/hadeeth_details/presentation/screens/widget/word_meaning_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/theme/text_theme/text_style.dart';
import '../../../../core/widgets/app_bar.dart';
import '../../../favorites/data/models/fav_model.dart';
import '../../../favorites/presentation/logic/manage_fav_cubit.dart';
import '../../../hadeeths_of_category/domain/entity/hadeeth_data.dart';
import '../logic/hadeeth_details_cubit.dart';

class HadeethDetails extends StatelessWidget {
  const HadeethDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'تفاصيل الحديث',
        actions: [
          BlocBuilder<HadeethDetailsCubit, HadeethDetailsState>(
            builder: (context, stateParent) {
              if(stateParent.isLoading){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Skeletonizer(
                      enabled: true,
                      child: Icon(Icons.favorite)),
                );
              }
              final id = stateParent.data!.id;
              return BlocBuilder<ManageFavCubit, ManageFavState>(
                builder: (context, state) {
                  bool inFav = context.read<ManageFavCubit>().isFavorite(id);


                  return IconButton(
                    onPressed: () {
                      context.read<ManageFavCubit>().toggleFav(
                        HadeethData(
                          id: id,
                          title: stateParent.data!.title,
                        ),
                      );
                    },
                    icon: inFav
                        ? Icon(Icons.favorite, color: Colors.red)
                        : Icon(Icons.favorite_border),
                  );
                },
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<HadeethDetailsCubit, HadeethDetailsState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.error != null) {
            return Center(child: Text(state.error!));
          }

          if (state.data == null) {
            return const SizedBox.shrink();
          }

          final data = state.data!;

          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                        tag: data.id,
                        child: Material(
                          color: Colors.transparent,
                          child: Text(
                            data.title,
                            style: AppTextStyle.font20BlackRegular,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Divider(),
                    ],
                  ).animate().fade(duration: 500.ms).slideY(begin: 0.2),

                  SizedBox(height: 8.h),

                  MainHadeethCard(text: data.hadeeth)
                      .animate()
                      .fade(duration: 600.ms)
                      .scale(begin: const Offset(0.95, 0.95)),

                  SizedBox(height: 8.h),

                  Section(
                    title: "الراوي",
                    content: data.attribution,
                  ).animate(delay: 100.ms).fade().slideY(begin: 0.1),

                  Section(
                    title: "درجة الحديث",
                    content: data.grade,
                  ).animate(delay: 200.ms).fade().slideY(begin: 0.1),

                  Section(
                    title: "الشرح",
                    content: data.explanation,
                  ).animate(delay: 300.ms).fade().slideY(begin: 0.1),

                  HintsSection(hints: data.hints),

                  SizedBox(height: 8.h),

                  WordsMeaningsSection(words: data.wordsMeanings),
                  SizedBox(height: 8.h),

                  Section(
                    title: "المرجع",
                    content: data.reference,
                  ).animate(delay: 400.ms).fade().slideY(begin: 0.1),

                  Center(
                    child: Text(
                      "صدق رسول الله ﷺ",
                      style: AppTextStyle.font11GreyBold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
