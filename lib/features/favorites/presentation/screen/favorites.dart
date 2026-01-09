import 'package:dua_zekr/features/favorites/presentation/logic/manage_fav_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/const/fake_data/hadeeths.dart';
import '../../../hadeeths_of_category/domain/entity/hadeeth_data.dart';
import '../../../hadeeths_of_category/presentation/screens/widgets/hadeeth_card.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageFavCubit, ManageFavState>(
      builder: (context, state) {
        if (state.error != null) {
          return Center(child: Text(state.error!));
        }
        List<HadeethData> favorites = state.favorites.isEmpty
            ? fakeHadeethsData
            : state.favorites;
        return Skeletonizer(
          enabled: state.isLoading,
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              HadeethData fav = favorites[index];
              return HadeethCard(index: index, data: fav);
            },
            itemCount: favorites.length,
          ),
        );
      },
    );
  }
}


