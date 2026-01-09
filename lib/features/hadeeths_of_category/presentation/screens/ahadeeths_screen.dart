import 'package:dua_zekr/core/const/fake_data/hadeeths.dart';
import 'package:dua_zekr/features/hadeeths_of_category/presentation/logic/ahadeeths_cubit.dart';
import 'package:dua_zekr/features/hadeeths_of_category/presentation/screens/widgets/hadeeth_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/widgets/app_bar.dart';
import '../../domain/entity/hadeeth_data.dart';
import '../logic/ahadeeths_state.dart';

class AllAhadeethOfCategory extends StatelessWidget {
  String categoryId;

  AllAhadeethOfCategory({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'جميع الاحاديث',),
      body: BlocBuilder<AhadeethsCubit, AhadeethsState>(
        builder: (context, state) {
          if (state.error != null && state.hadeeths.isEmpty) {
            return Center(child: Text(state.error!));
          }
          List<HadeethData> hadeeths = state.hadeeths.isEmpty?fakeHadeethsData:state.hadeeths!;

          return NotificationListener<ScrollNotification>(
            onNotification: (scrollInfo) {
              if (scrollInfo.metrics.pixels >=
                  scrollInfo.metrics.maxScrollExtent - 200) {
                context.read<AhadeethsCubit>().loadMore(categoryId);
              }
              return false;
            },
            child: Skeletonizer(
              enabled: state.isLoading,
              child: ListView.builder(
                itemCount: hadeeths.length + (state.isLoadingMore ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index == state.hadeeths.length) {
                    return const Padding(
                      padding: EdgeInsets.all(16),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }

                  final data = hadeeths[index];
                  return HadeethCard(index: index, data: data);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
