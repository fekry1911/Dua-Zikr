import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/hadith_category.dart';
import '../../domain/repos/get_categories.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  GetAllCategories getAllCategories;

  CategoriesCubit(this.getAllCategories) : super(CategoriesInitial());

  Future<void> getAllCategoriesData() async {
    emit(CategoriesLoading());
    final result = await getAllCategories.getAllCategories();
    result.fold(
      (failure) => emit(CategoriesError(failure.message)),
      (categories) => emit(CategoriesSuccess(categories)),
    );
  }
}
