import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../hadeeths_of_category/domain/entity/hadeeth_data.dart';
import '../../data/models/fav_model.dart';
import '../../domain/use_cases/clear_favs.dart';
import '../../domain/use_cases/get_favs.dart';
import '../../domain/use_cases/toogle_fav.dart';

part 'manage_fav_state.dart';

class ManageFavCubit extends Cubit<ManageFavState> {
  GetAllFavorites getAllFavorites;
  ToggleFavorite toggleFavorite;
  ClearAllFavorites clearAllFavorites;

  ManageFavCubit(
    this.clearAllFavorites,
    this.getAllFavorites,
    this.toggleFavorite,
  ) : super(ManageFavState.initial());

  Future<void> loadFavorites() async {
    emit(state.copyWith(isLoading: true));
    try {
      final favs = await getAllFavorites();
      emit(state.copyWith(isLoading: false, favorites: favs));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: 'Failed to load favorites'));
    }
  }

  Future<void> toggleFav(HadeethData fav) async {
    await toggleFavorite(fav);
    await loadFavorites(); // refresh
  }

  bool isFavorite(String id) {
    return state.favorites.any((e) => e.id == id);
  }
}
