import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/text_theme/text_style.dart';
import '../../../../core/widgets/card_cate.dart';
import '../../../home/data/models/hadith_category.dart';
import '../logic/all_ahadeeth_cubit.dart';

class AllAhadith extends StatelessWidget {
  const AllAhadith({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllAhadeethCubit, AllAhadeethState>(
      builder: (BuildContext context, state) {
        if (state is AllAhadeethLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is AllAhadeethError) {
          return Center(child: Text(state.message));
        }
        List<HadithCategory> data = (state as AllAhadeethSuccess).data;
        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return CateCard(data: data[index],index: index,);
          },
          itemCount: data.length,
        );
      },
    );
  }
}
