import 'package:dua_zekr/core/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/const/fake_data/catergories.dart';
import '../../../../core/widgets/card_cate.dart';
import '../../../home/data/models/hadith_category.dart';
import '../logic/all_ahadeeth_cubit.dart';

class AllAhadith extends StatelessWidget {
  const AllAhadith({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "كل الاحاديث"),
      body: BlocBuilder<AllAhadeethCubit, AllAhadeethState>(
        builder: (BuildContext context, state) {
          if (state is AllAhadeethError) {
            return Center(child: Text(state.message));
          }
          List<HadithCategory> data = state is AllAhadeethSuccess
              ? state.data
              : fakeData;
          return Skeletonizer(
            enabled: state is AllAhadeethLoading,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return CateCard(data: data[index], index: index);
              },
              itemCount: data.length,
            ),
          );
        },
      ),
    );
  }
}
