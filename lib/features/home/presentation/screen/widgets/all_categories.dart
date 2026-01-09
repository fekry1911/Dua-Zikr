import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/const/fake_data/catergories.dart';
import '../../../../../core/widgets/card_cate.dart';
import '../../../data/models/hadith_category.dart';
import '../../logic/categories_cubit.dart';

class AllCategoriesList extends StatelessWidget {
  const AllCategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (BuildContext context, state) {
        if (state is CategoriesError) {
          return Center(child: Text(state.message));
        }
        List<HadithCategory> categories = state is CategoriesSuccess
            ? state.categories
            : fakeData;
        return Skeletonizer(
          enabled: state is CategoriesLoading,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return CateCard(data: categories[index], index: index);
            },
            itemCount: categories.length,
          ),
        );
      },
    );
  }
}

